Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996313;
	b=tJ6dtblWxYWjWgaKJ+v6HcJfc8/76eln1y5ywqvj2FikA3yAM52Tq7ZYx5LjrUIN6Oi/
	 HirtbfnhLNQ8RBzz3U2b+qg+YIon5irkvrhgJH95/ZOyfnsefrDDkj7TS1rcpT3qub0pN
	 rTJxIngua85lgqLqWYDZQwpsNw+7b4FflBYrMdzHpX61DMr/5MqHkgpWKAZw/KLEejuS5
	 AHNuSJq4BvbVhDYX7C+y5Cmwj5pTHOhyCycwTHp6gb/FoWYyOM8uDxH+MtsUB0IJ4nyPZ
	 wxE+izSe2pIoH9EzsEsPgxkBcwJwReKQDJraK7w5hyFDzoyA2sofX4augYCVwfb1dbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996313;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
	b=WF41WGIC3DxXtxnmXISlxCazH5k0YVoZ0B17RmuN60hvVdxNoa+Sib6ojvBDBCSyjDdY
	 3AZ3iFcJmVASpOY8lC7PhOAXvEMl5EQFLnJVAAbH0OBxV9RlpoLZz6RwlFjsacUhb2nPv
	 l91fvpLVVpdy4M0iIr1mmpIAgzlZg69OKWiWgVzA2MxCVW+DWDs57m9E078IdQ6hpPkRC
	 m3gxTkMeOuAKRYK3M1kUm45c1qBjupLmGxlt93YNKMirtKh8lzuilNTFLWpsglxG5Xjsm
	 tNBSOOfqpfomF9VFNYzE9rBlpxRCedj4/jH8wq+h74xv8WKaep7gLJg2nRYMqlb5ppQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ppvdOeZ+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jbiCAEuJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58641606A891
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58641606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ppvdOeZ+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jbiCAEuJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kPnR3071762
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=; b=ppvdOeZ+gCtRvLlk
	VV/g+v5DCnJRgRrxbeeNfU7S3+9iFl6kU3+wxns0bNJ/MOhtz8uo4mLMUTQgLXJs
	vo9avHIUZNc9nzpXu0l33euzcNIUxuIBC3S77BDVcdJCFM5LuCkPSIYpBWFvPPuv
	DKDC8JJ/WvdZnwqbMKMO0+DWux1qmq3Koi1Tlb4nwkKCumbfzjRDYjwnde/EzO6k
	ygziY5McD8zjtQiT8xq5b5e7a0Y8+ev6iz3qaXRxI9XLVWUVSIVpJdlq5Cz0pHsA
	L7WwKfInupQqdtwcsiIFYJxJb50B8nn372IuT55/ZznJsa7UV66wfWWeB+esQ+VS
	V2rf9Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8te39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:05:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so172924585a.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794996310; x=1795601110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
        b=jbiCAEuJi2chkfG4xglXwKiHm+JgYMJOLWKW1pOS2ca/1pPWzkXsTrLMqnJE30sYQA
         /QHLEZtGhc9PzOtlHrnXR3vGgSMXxEhCjiRG3xUjzRVtRXvFNHRMqPiyvtuGnlDVrUE6
         1xX/chxy1y+JxXVEUHWM4o1cOHzN9nmQcNF72MheNexDDMsTKRXCPeH8mML/RX/QYgUp
         OgN2ldins6Ca6tjNJm6TOFUjuoSLiVZIXvvCOshJmKtZ/Gn9xanJfpSh5xSVPg/BKpCa
         CuR/Tyv8W2DLapXM4bXD0+Gs1kT7RiQmVEFmPmAFzjcyqcfE6p+LUvECtz4WH14Oc7Yw
         UFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996310; x=1795601110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
        b=YW5Ny78RVxcDKdLTI8tTxHxqS1DZT5RN6hm3Rti9zW6MLGrKJm9oOD4aG8MGvIsNbn
         ij9tX+dsACcni3xRvlP+el+H/4ppqJH6xnQlp35OxA23SAeA7zvqffSBiOTsgCw8byhG
         1ehCkrlQ3lxYUSU0Qu2HtGroQAcqoUcOHHdsJcgVhEXDxfHCqiJ3XwyJOd3D9ntCVWV7
         Kn8TQpb9Pc8EpyYnpjzHctC/ahduJa4CN5OX4TgAmJgygDXvPBKCGgCaxk0qC0+9WGDV
         mG8GEWJx+pN+GWHO1eg1BEkPZeX25cH299WXvQAVpbSaCm2KqCknfSwLcftWg9gTnNSp
         C0rw==
X-Forwarded-Encrypted: i=1; AL+hErHjHqEjuWZZ+Y+OuAl5BusQg11bUBS2b653Ue3poTSbK67VfMKge8gnNV+yF0ZU5Ivb1EBc4Hw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qi6ZUcGQuA0THdTxSMZ7GOEmWea7DCMSyC0Sm82qlwAYmH/Ym
	eUtp52v2hPnpwj7qu0sFcJOKNn/I7SO8mrKed74OFKEQ5lnssNPv+ruexeBDK+4zdJIkqWU+1Sn
	wh3os9FHGY2mvPrlBs2gN+5BhhAs6xPc1gSEEaYBgOB/YSRE9+o+aK7ehAyo=
X-Gm-Gg: AYBFou2/x7qfk3lTCNODVjAotbyOt3SrxjAPhGuot7v3uDwbfmKrQFpAtcRpOAwU6BE
	VKtr+iMLWCEynT5ZmyB8F/O8VB82NtB4IwDxrUIJd346SMOIOpnv8ZtBvM2HH45MomjGHC180Yp
	01Wi5tWKfatEogINem5LCDBRb3VZhFuFN9WR68IyIFiC1dT4tJdZ8F8qq9TokdsIXAr8WQi0Lj2
	I2+iNgNBUgX/YEJZhmkmqcXxCnunoq5d3IgffEdqjEwrDXFwDxCzFBPNV9jy9EiU4301cRFiNWb
	KlAuCYZN0GIN92QhIN7NH6vbgkGDZJCJyR+GcD7sSGiiQopT3/d40mFmE6U3qkWtDW3iZWjMc/8
	Nti9jxJJiCRL7ytK0e+1vqHBSNhUiviBA03K/5K6n3LkfV+RGNnY1PgVDb2yvY70tjftn49mC2s
	Q=
X-Received: by 2002:a05:620a:28d0:b0:949:6668:a8d8 with SMTP id af79cd13be357-9499961da5amr395485385a.66.1794996310540;
        Wed, 18 Nov 2026 02:05:10 -0800 (PST)
X-Received: by 2002:a05:620a:28d0:b0:949:6668:a8d8 with SMTP id af79cd13be357-9499961da5amr395480685a.66.1794996310050;
        Wed, 18 Nov 2026 02:05:10 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609389dsm3735509f8f.37.2026.11.18.02.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:05:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:05:02 +0100
Subject: [PATCH v3 1/2] arm64: dts: qcom: lemans: fix iommus SID mask for
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
Message-Id: <20261118-sa8255p-emac-dts-v3-1-e2c365d95a0b@oss.qualcomm.com>
References: <20261118-sa8255p-emac-dts-v3-0-e2c365d95a0b@oss.qualcomm.com>
In-Reply-To: <20261118-sa8255p-emac-dts-v3-0-e2c365d95a0b@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/XhQA8eVIX3pTCurixAQxn815mh0VWbVJxt0R
 tcTRdf7qB6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCav14UAAKCRAFnS7L/zaE
 w6zbD/9R2S+lyODnntE76ycbxB2bBSAhOzu8OC13RaurkdWxQns8YigP8q5HkjUeSiBjKiFENLE
 iNqwva+UxVy2eu2111uP7al/m88t3RBM9/batM9gawlaDHtXl0AXV4oBdRu3TG+NNtGtNcdsL42
 MzMl1yiq4tWebBTO3ErwBgdyeV+eKRW0bBUVuRx6LihNJmt4cFeJp8L1IXUneKXqolmbbFFLSwr
 DXvIpYjWQUhpXlQXXzfgR1p6RGGVtNvWdy5+HpYKXYQO3w/LkUFCmSn8gge6CE51c8+hgANm33g
 gqdHkB6q7RMWuM9ZAUSYAN9qCVq2qbMdy01OzUVIX+gRhufpWwHHmthcv//gs2bIHGrWZ4JIlcL
 6SIn9fy1m/yuA9eUcSd1WWLjPFewhtMEnIM8rG6thulf+EPYBKrMzjWunNXoo5RfvJ8HsizfLUg
 qjq6biwthhF2nhimxhKwMhlQRrVgIcWFAWhoH3K6gTeGUjT66IlYZ4Tx+tljnh8+H5qWB99jp5u
 hQe/GNgTMsY7NYjcd5zr2TToVp0OwLZ58vtLKWjV0eFxpFX6mPeqMwDwO5Sd/Bwc0zqdtlDWdKj
 a91QmMs+6Ri70eG8qMF31wzSHxBHRH5vvXWd4vqQKTT0kB7JrSyexUWDdFBILINxEhY51Kaywol
 wPJgZlj8OsKs6mQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 4d_0gcoq7BPyybuK9AlWLCn-XboA64gz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfX4ZQTMFQMra0O
 EArULrxtTlgSDb7MExRLOGsR4XBYG0Gk6Ptf4DJ9JMRBiCMKbP+ltDn+G3m5/DzRPgQdsjtsggO
 TOgUea+SwRvCV/tl52LeqGl1mSJHAP8=
X-Proofpoint-GUID: 4d_0gcoq7BPyybuK9AlWLCn-XboA64gz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfX60h8CfZtxUjU
 6wArmRu0xNdqDALxdwla9aXuM24nfgmGOWhSElAytZPn/YI1eDZ7oC6AhQBRnH2EjCImo+X4emQ
 fh+Nk44hlMc217JxDRP30NAsISJ3KEJNKkfaUTWPT8lTOeKPmNxPErKsWnqyUIpBTERWuZKSzkc
 fHLxV9KJRC+bsKjkAqqfXN223tg14vlblmGqcYJt6eNAV+nRpOsFw+jwe0Lz8b2FX16MuUaTidp
 5SqHFmuMthSFTSXHOIYIWBwZ3pP+C1Mbke2HTIPrEjrR379slmgUurg6MePQMkDPOaCJ1ErViFq
 6oslD0Ld3FRsuDQxJ6cXepaJsFm/O47opsaJi2yWsRYLNBCXXZ4f8B51wp7W7GS/dOQ7JHzz4LD
 uy+Xlj/IbnTi7HJdkbrgTSg13IMMziDDir02SFAq2dWdv8J4wfB9iEdQ7sjQd5PkaSZ8MAEvekP
 D7xi8v3O+zec2SG8wpQ==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd7857 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jHMX-OgH2kBFWhD5V08A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180039

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

