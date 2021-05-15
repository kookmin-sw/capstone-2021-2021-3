from typing import List

from fastapi import APIRouter, HTTPException

from database import db
from models.device import Device
from models.organization import Organization
from models.user import UserOut
from utils.pyobjectid import PyObjectId

router = APIRouter()


@router.get(
    "/",
    response_model=List[Organization],
    description="쓰샘이 설치된 기관의 포인트로 내림차순으로 정렬된 리스트 조회",
)
async def organization_list():
    return [Organization(**i) for i in db.organizations.find().sort("point", -1)]


@router.get(
    "/{organization_name}",
    response_model=Organization,
    description="입력한 기관 이름으로 정보 조회",
)
async def organization_detail(organization_name: str):
    res = list(db.organizations.find({"name": organization_name}))
    if len(res) == 1:
        return res[0]
    elif len(res) == 0:
        raise HTTPException(status_code=404, detail="Item not found")
    else:
        raise HTTPException(status_code=404, detail="Too many result")


@router.get(
    "/{organization}/devices",
    response_model=List[Device],
    description="입력한 기관 이름으로 정보 조회",
)
async def organization_detail(organization: PyObjectId):
    res = list(db.devices.find({"organization": organization}))
    return res


@router.get(
    "/{organization}/users",
    response_model=List[UserOut],
    description="기관에 속한 개인의 리스트 조회",
)
async def organization_user_list(organization: PyObjectId):
    print(db.users.find({"organization": organization}).sort("point", -1))
    return [
        UserOut(**i)
        for i in db.users.find({"organization": organization}).sort("point", -1)
    ]


@router.get(
    "/{organization_name}/users/{user_name}",
    response_model=UserOut,
    description="기관에 속한 특정 개인의 정보 조회",
)
async def organization_user_detail(organization_name: str, user_name: str):
    res = list(
        db.users.find({"organization_name": organization_name, "user_name": user_name})
    )
    if len(res) == 1:
        return res[0]
    elif len(res) == 0:
        raise HTTPException(status_code=404)
