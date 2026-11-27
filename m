Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795666;
	b=S2xJXoDKk1YcsS51GcSFDqJ4cwepJLh3dGCRHeFX2RlxbS+CxaMRmnASSYxYkKQdihCQ
	 rpzY8v2lJiDAZUCO8dCwSGU1fsBkpqR5Mx0dO6bFmsvKQEintBNmDbnWrQh4mpjWWMyuR
	 UQHX42iFeo38uifgQEXCTTvE7WYzRKYMn1+cqOka61fhcQAkuar4XowdAFrbfPIVm0KxF
	 NOzKJ/P/AXemADmgVHmlVwY6pzzAPwhCVVwPFLuGm0PsAk/B5XP2OXifBqxJ1RjjtzFHc
	 nneWGL6oM76pmzy0aaa4sp/jG8Lii28/sCN7an1YlVO4JpI8/rowoyu5DUAyS8ZywnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
	b=mF7taClge6b3daHXGVwBwbSBFkzxJtC3sYrmJvhRiUXpqVPXn1KiJbPas7MWeOnx6Wqy
	 cgpXB8Gp9Gw5PRWeE1IiQalVHeCQQuVhIV9czMn47f2VUA8GV6/XQ5Iu2H2L5Ok9xnalR
	 dlvQtRNfV2DOCnRhdvcAAS9xoV4nvhJufuDJqfSOUWWZvNMv7Pg/ozAhq4bunIHpbQTj8
	 H8lkGAVoEC4ZSZEfsu2/5J5K0U/+Zs24vHhHkU1pRn45I3Ccv1hTR8dj/va+gAWz+8brL
	 HCUsYJgx7pR7mWHnl/y+hq1FlnnHRX8yqM4OI3M/v2HNDCR0Ae1mHsi+zdFHfprPrXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiAXSHT7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P2A6T2L5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A1A606A680
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A1A606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiAXSHT7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P2A6T2L5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpPI0065519
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=; b=fiAXSHT7Y1boPPhF
	Qg23XEUKsfDzWY3hMqhcosHPiUf7YXbZeN74E56z+YS+xLj/2bXojzTgxvwkWuuV
	5/WvVrAcqZ8KTIvCjgKg7+bUJ/aIQTT+dD0DGR6MDoNPCiF1qH9z64mIvKedZEC/
	YW2b6Tdx5kpvxZGyWX6d2k4rFpXWn2MKhyqJpltvnEyeEMr+5WZUBSkmE0vzr7rB
	OVqDkQSPbPLUl49EsYKI2AzE2t6nOrWJ5kCDUn8+/OI/0cl4Qh9QbjMz1Tblr3Jb
	bJ+tT4yxHLcsB5QxsX5FItbc0N9n8zZqS8f1P4igEtFEWoJJjqY79J43+57ColUb
	Wov+/A==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dhadmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:07:44 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b18c67095dso106532797b3.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 08:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795664; x=1796400464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
        b=P2A6T2L5ISeFsDzTFECAQUrZmshD1ttqWLne6rt6D3ymrV8BzX1JAwgEvSPW5dPZdn
         ml17BA3L3T2j9jlBffahloyD+htYxSTxRllU6z823V2sAG+xnW0RcTr8Tsu6U9oKmySa
         e9sFhvxm+20eS8v0FmsSv7CCfIUpOWc41YVAN+svQAYc9Z7/adRTprw0Fc/61rYaaiR6
         qSP3NVGl8InUImBjqQIMuGaVi+3pive7QTQezh5j4h3SqAAw0dNTiuWBU5h4spEITzRw
         DlPlRVyKp65WvcPfvmVfL7uSS6+ypxx7gsoMSa7Nx3FEysZ6+OzvA1/LZi7a5spJlrMu
         vRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795664; x=1796400464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
        b=Dra9w6Z9ZFWSSjkIiNarOZZMeEaqFidJt/QrK3wpRpDScBLseKObdL0p3Pa5ckTbaR
         QexNxJPGzBBS3EKtR+WDeL2t2HgRUcHJX/+4lhFCCQh/DgUCfeBcKQnAJXHweu6HnnaU
         WeDhL511bbPcFJVCqWQKEZmlBUjyDZmsKkJuMLIoeBG9ZR+8dQoMhNsnPY1mgHqaXwsV
         BMs+02Hb62+eeNUuFW/LpcN14tTSMd72XcDXjGRI09JuxgFcRPNw8l1PXPpvjryyfb5u
         vW9UrU0iCIJH3/pmaN2N0OlyDJZM2ZxKZ+c4acPj5T26CMS/yfg+otflpkAdo8hEZS82
         05jg==
X-Forwarded-Encrypted: i=1; AL+hErEgM/aDltOv7QsTqz4GCt03JTrYth1MjwzTe4vVJ3iyH6S/VgLwwXThuSfvj+VlIUYRcodaGZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BIrmU3efz6rq6eDI8qO0k+F/K5g2SiCfQTz3b7KZEORMFViK8
	A7k5G65Hh78c+mm/nPZxYEiumvuq6bCZJKLYJ45iovRoY7dPcG1gV7SjUqDmY7f7bD7iBOJgre7
	ASxp04QFdOHNKqy9yFi07inE7NAJ8LCPt5Gy61gFx0u+PUK4UP94v/dOV+fc=
X-Gm-Gg: AZFdTZdmQcD5VLpnE5Uc4Q96wpfms2e4dbEs4mYcQVk/5k2ekm3HYdrw7qI4TY1NAfd
	OVEqdPYcPP3hVX+oSx78oMWB8iqxDaTn7/RANaD80aJQMdOG6MsH5UolTQVLVgEgOy2ZuKHbqa/
	9J+3bM0/KAg9LkhvD6VpLlYM3GbmAdzq2cTjiYwXP3yjjw1Ul/IKjKosHzKRtiH9NytUCOKpVbV
	kI8RfHi6AhMkfjJM4JpPcsw1OWklBiv7keGvrORieTrgmkHbA2X+kFbG3Fj4yjtPM2RdJ/I1uSs
	SD2YrDAqOH6ZLLj7kgiAnkRjGtHxxEz6lVz/5IZN/iSTX7TWqVZ8sg9nv1NAtfs07AabmJ7ybHG
	wAFw6+rGEtEbLw60ji30phuARwdi1wrfgX/SaWCV86UVwIWyNLxT41Yi0bKIarNra7tnxJ0gJVX
	/2+IJH5HfGH1A6/cmuzKy7oxTxXUDdSrEH3rOJPg7tnq6IIKADdxNEsJP8CrB9Y0U=
X-Received: by 2002:a05:690c:a89:b0:8b3:7782:675d with SMTP id 00721157ae682-8b5204d8021mr100633257b3.47.1795795663524;
        Fri, 27 Nov 2026 08:07:43 -0800 (PST)
X-Received: by 2002:a05:690c:a89:b0:8b3:7782:675d with SMTP id 00721157ae682-8b5204d8021mr100632857b3.47.1795795662990;
        Fri, 27 Nov 2026 08:07:42 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm46623137f8f.30.2026.11.27.08.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:07:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:07:37 +0100
Subject: [PATCH v4 1/2] arm64: dts: qcom: lemans: fix iommus SID mask for
 ethernet nodes
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-sa8255p-emac-dts-v4-1-f0c5a95cc6c0@oss.qualcomm.com>
References: <20261127-sa8255p-emac-dts-v4-0-f0c5a95cc6c0@oss.qualcomm.com>
In-Reply-To: <20261127-sa8255p-emac-dts-v4-0-f0c5a95cc6c0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5XFVjff/QR80SQLKKFqKe3LuP6yj+0SGfsOuiR06Wa4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCarKvw9wSH3FLno4NflMnR1+eeMpV13hBh0gb
 u6WX/rlxNaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawmqygAKCRAFnS7L/zaE
 wwryD/4rvgx/F6iajtGvhQ/lg7INvhEWm9d7ZcpEDUtKR4V64LidQ+FH8nRtH/d+BJElALor1JE
 C3yx0ZFQ7ZvDQbQlp4TQsPRzxOCa7TCtbxtsxO447c0utky79Uk2erAlFGY5JbeRb3SEBN+tii+
 zjnCCzWncmrjlGCtd5AkBk1edKUHTkxNeoHGP3J/i8mz848Uzzl45iQF3pEzqedjTsDSPRw/zeC
 09JjAECH9+qNLaNmYFhqO0NxV20oUM9osat+tvXhACZ0XWFGgiVYEM+/HUIt5+83Vd5vVMGWB3Y
 7ORw47S0hxGzBSFzKl1ODV8pNSaIvXcBwR4U3GRwpMUc27UelBUuouyOrqducPyaH3Fc4Et/nJY
 u9vm+b7nAS4U5bmGz9UUA0FEbTVOOi68Ky3jTY6uhoiehiAQJ5q5te7Mq5dtkIK7e+1Q7RSGZaS
 AC/6d4NsgHYtioQ1c/kBQ8WyhuL4XSSt9Q4Nqr78GQZcdwB3goxHYWlnhewdazU3P4fvGo0nL7C
 g+40+bs+Jo3eWd6g2q8uokwshW9bYd8/i8/+w4lPkSLfRPZ5ZXursq3kpLIY1F0PWXRA8X79Xpp
 9Evywv8L6tbmLjtfstTc46H/7+7W3vv5pOXDo3n9KMKU7ZAHP9TYDIXnIQID/1venTFw/EkwO+i
 AmGbi7vUoxKKDMA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfXwUAUVqW3+oea
 XM7iGc0CeH6fuFV8iX/d2mW+1YFlGX5arKsl4NILWwYGq6DfrAqucE8m6WMYyqc/jFtVvQnbYHl
 nstO0setKJkrwllkzIuWjOFFMsaQOaOQ1CminOsffWU64jfLEnnKvzTD3hvsPSSZTfHZ2wy9VHg
 Ly1BY5MxEMAlskqMxzuiBTS1wReRxv465RNNm9Y8xwEwrRezNgyrBVwe2h+1MJIJlhDh4yXohwt
 m83FmOLHeGDwyktM4nI34zacVfoT0lvJ+6NzZA3pUEYPqLn+V/mU8gJtyr3wVe+koAyzUvT7ARL
 yVZ6yiZi1mOkg/JLo375dimAwZFpWUosM45UJTUNXJy1h+iFpOfzhzb/pgp4z/11LpFsopITiXj
 dVV61uuWIUdoMrqYe1p1iTqk3W+/l3NfV2EDeaBOQx4y8WBcKxIdcapN8ynzL17JrikqsSaxl6p
 xJBhmuyqbUC8ebXqw7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX1xpIiKhT39+F
 qojnOUnDGmrGjD3LmJH9B8VZHD7Tq6M4tQng+6elMrqPtLGiiNbq8NFJg+u+3T5Bhx/w8hogC+5
 Kv9WOMc4KvkHd77mEfUhGn/5+rBflzs=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b09aad0 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=jHMX-OgH2kBFWhD5V08A:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: -d6HuOocIU4BPOwjvNFuElVyXIL0239a
X-Proofpoint-ORIG-GUID: -d6HuOocIU4BPOwjvNFuElVyXIL0239a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270064

The iommus mask for ethernet nodes is wrong, it makes the SMMU mask 16
stream IDs per MAC. We should actually only use 8 SIDs. This has
triggered a crash on sa8255p after a boot firmware update. Use the
correct value of 0x7.

Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index e298747c06bc4519d10f3f0765d0d6a54aac19b3..4e1755a7f2cdce07c454329760cf9a1a2b6b3977 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4401,7 +4401,7 @@ ethernet1: ethernet@23000000 {
 				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x140 0xf>;
+			iommus = <&apps_smmu 0x140 0x7>;
 			dma-coherent;
 
 			snps,tso;
@@ -4422,7 +4422,7 @@ ethernet0: ethernet@23040000 {
 				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x120 0xf>;
+			iommus = <&apps_smmu 0x120 0x7>;
 			dma-coherent;
 
 			snps,tso;

-- 
2.47.3

