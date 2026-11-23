Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431218;
	b=Np/aROtfosmB5FZmTabiXPj+5gcKp7GDs4fG/xzdmrIY2Jvc/qizU7uO7G8q8ol4KLST
	 RWYWGI7BWI/dJO41S2I/dZtQam+h4KgVrR0Qt+O+DlMSPSCLcmy1aw9bILHosPXu7N297
	 yhXf9ymNxTVQXwxkyNEczmzvAfLhKlZAmDXtNiiAELfzwEwrKuCTtJoWAAON/3bix7ubl
	 eLuzUq4JnAD3luIQ8A9uwrfkh3Uv/xdkSbMJTIwO7QlzvO65C+PruoaQvnuwTZ1EWa6k+
	 q97Y6ne5afrsWKor/lPqEUp7ZHdMCpN1o48f28oCzWq5gSBe51qjt/iMNjR1GGCAOrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bNh+CyyEc4DwqBf8wMJAEGceVFKZ9FL5VhwVvApn47g=;
	b=NZBfaow4UCMlvsIR+gm7RzLcuv4hz7go+8HsVFcYm1qgRY8cu4UskMPfgac7y098ZsNh
	 BZ9gwTUvt2GJynS3sYCBLhI0lL9hfE6qWZD+Mp4+U92H6GaFDrK/mnvLpn0eGWcNvLBVo
	 LsFw8BQlzCgeCjDkcmMVIk/e+pY+cr5sO2ytnqCigbgvK+PS3MeSsCWuHtC5kZo4oKmEg
	 InETGb3+mbgvqo4BGCsLVJeNI2thIRlINFYrxh+4xa2ymCgY9uuSQwQaZBmj/lwsz1D0y
	 zp+F5E8djF9vEiCVMfeR+FTRs05GRVoPEgC9m7IMIaVwERPXrsa8KozJByUP4irJ1Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HX3HwfBC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0NRInf+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F74606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29F74606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HX3HwfBC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0NRInf+
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FuKG1543949
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bNh+CyyEc4DwqBf8wMJAEG
	ceVFKZ9FL5VhwVvApn47g=; b=HX3HwfBCWdXddtSwB4vmaRfMN8yczlk5b1UupW
	RdZJC7p3jzLKWOdaFpDy8J4KzHGAfX+9dN94BPJ036lS7WA65NjVSB6oCOVplQuS
	VVWxOU28L5Env2+ooo/tK2NQVqQIbEATQtacmCNhP1JytBHmAbM/bErZRjHUCeIw
	pYXU+bh97mXVDWGAVTmSB5KRtkyxFUnaM5WcER/Da2pulRCo24a2D3gg27vXu2P9
	E+ZGv7zWJh9wwsbLGZlhlpHNYW/HingX8FXsMAJgvlfXu/2Y3yZDP55j3S/GpTMP
	f3qHp43Bbk5d9YKEXOu3Twyj1mGBPi3ftb7w+aD1CV3sGjcA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy01291-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:53:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so3385267a12.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795431216; x=1796036016; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bNh+CyyEc4DwqBf8wMJAEGceVFKZ9FL5VhwVvApn47g=;
        b=b0NRInf+k+rov2pCqiSbuliuxvZN5qe/RO0VdbSD9tdUFIgLNJkyCg/BiAl8FNedHP
         MqiL7EG6Y1CkQ4mGPTiXbvjB1OJ7F9cCmrHHvrNM/ZYRAdU4oK5p2uZR0N4LxVzYqDnD
         NKmNpzHPXb/6iZpG2CW7yu3i5Vcbzc1sWHdPJ/WmnfBlAetFtctSIMToK2NOr4MJc8eq
         xgRbWAsqvks/enCbtOw+bFMpSOp/VFwev0IElOTDlYSXttddiWr2QvUuH7SRT5FXfpKu
         1YcvhYbUno4/x9Ij5i+FITZlM+9N1DAhd19jPmwJuIpUFx2h1ls8Pp1g076qX3jhH/Mb
         4dSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431216; x=1796036016;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bNh+CyyEc4DwqBf8wMJAEGceVFKZ9FL5VhwVvApn47g=;
        b=lrvMxOJwNFfH2IewwrZtQxaz9Itr4iD9bDVe8NQ09WKVQ1rgNeJmyF5q1DsZgOPKzc
         ykGbewUdMkmPfEw4qu7up8k/zt1qCe4cBIBec9ZDy5pfPCC0b3hT5TFFDUGTEtGTDpw5
         +Djojxqh+pHOmLBV+FTkFGZKHJNjkOJ2CBd625FtR50sV/7OY35Bo9geq0dNoiFKWL6+
         7+j8d2Pe0xpnY7dGuVFTLCYhsWjklY8o1CeiALBOFe4YsnY2axqIzlV0KltdTS1DoeDz
         gvD7pDvW+nKK1vxEhs+Zso8tjMcf4tf2wYsluG3OpZxR2uIvLOXbmes5iHyShiVwS133
         lN7w==
X-Forwarded-Encrypted: i=1; AL+hErHcgaEEV4PC/KPzV2khuWuQngDtlFxb3KtoEQarNJoqxhl7C7sDPcb9gRijTKCpTpe6KHemJeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s/K7jqsA+NFrGgb7X/albDpUWZL4NyrYmaxDdbCimTZpreFAV
	nplGlpHnb+hvjS/uEgYQ3v3H0dmoAaqeh/jS53lLrMZrywVurw7SEQ91IuwsIvIBFFBDWRxF06g
	LAWkDopDPw2i0v9XGDi489CQIdYPE2qZVR5EZXXtN0epOlNY8O/2m2oRikCA=
X-Gm-Gg: AZFdTZeQjv80tEeg1rGU1/TB/xNX/B2vPPb0faBBR/vVhDdNUlYq7FQez5/8y1sgUzL
	h7OOR9U8TWMmWd+i0AD+GNztj7q4x0koYz/0sdc1c+lkQ6pgTAl1uToVfnPkByWdl3crchXN0DK
	0eKk8qzpty+NaSCK47P/v23vVPh9snssTsXpwXLr+WQd8Ot1LQfKHXKfE/rbv3WeCPsASWvD1FZ
	A1t9f2mHveLW2aSPI4BJZ9nuBNWOJMNx1pidUVY8mcREd+NAKvdwiFSONB5grGhoaeLk0XheaFT
	/XoaTtY0nhoo+NHAo32BFXAyrmHAubWjsQn2nXys8yajxqvPV/4yxt6FV6qsoA0kDfDE1NIZ7pv
	Va++qi71F9p3WzQ7e3lHmwjNugvjqoD/DYZnvLdUSp80lqQYQwS1pdxTBj0nREUsdwTCL/F/bdD
	im/sxSrmtneaY=
X-Received: by 2002:a05:6a20:7351:b0:3eb:a4ae:3aa9 with SMTP id adf61e73a8af0-4014db5890emr12796900637.63.1795431215978;
        Mon, 23 Nov 2026 02:53:35 -0800 (PST)
X-Received: by 2002:a05:6a20:7351:b0:3eb:a4ae:3aa9 with SMTP id adf61e73a8af0-4014db5890emr12796862637.63.1795431215504;
        Mon, 23 Nov 2026 02:53:35 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e456a7sm5330863b3a.29.2026.11.23.02.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:53:35 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board support
Date: Mon, 23 Nov 2026 16:23:09 +0530
Message-Id: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABYbBGsC/42RwW7DIBBEfyXiXCxY7NjOqf9R9QB4iWlsSMC2W
 kX590Lcqq2USr4gDQxvhuVKIgaLkRx2VxJwsdF6l0T5tCO6l+6I1HZJE2Cw54wLOuAoXaRdkNp
 TY50c6GqMVAXrjvOZclWrem8aBShIAp0DGvt+D3l5XXWc1RvqKZOzQ8mI6bp0us9bfzLyWfb0N
 k4+fNybLjyzvku1W0otnDLaaamwLQ1ndfnsYywusxy0H8ciLSR3W+CHzLc9d4FEFhIb3XHdtgL
 +IYvf5G2dRe6sWGM4GKa76gH5tg404GVOnzetU/5KAcFqqAAKEFXTpExOTzJMvT0V8RHq9glav
 eC3DwIAAA==
X-Change-ID: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Kishor Buchi <kbuchi@qti.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Karthik S <karthik.s@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795431208; l=3830;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=Dx9co28BgHh+ZbRepP+Xi3Pa2bEV5oGrB1qLTdgcJbU=;
 b=4zyKjN5Pm0j88C6+45ST9/N/UP/MG+/PJBJwPyESKzaRhVvZPWR2YeOUtk+X/MWhfcNyDDiY4
 DDpJnBPQg2zChKMMKOSBz3q1NibLJe9gOKuu9y4L/DFwQ1L3JpJm2bN
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfX22hlaojBnHE/
 uRb39R/WGOTc2E/OScsG71G2RmdbU67Nb9T5rAnooeNA9GjffDdAQ+Vkr44kSQND/fR9Jug9X2X
 CMY4t6zzFqDsV8EjyqilWIx2EnMxlwQyXa4/bnawdGR5bTi1HDiS+2bu3OspVCX3naAKldHDhrJ
 7Hg7eDQDkYO9zWOuK536KDlhM/AYxLG2rPpEx/7227PcwArGiIbdPnm+ud44JFhPoPBihIk4wpp
 tCiNFRc+Ko7LNfKJzwN+ZRQq4oBwBXNYHUqiAZx+FKeSUAkrK/JC1hE6EnggVEJOQQH5KXpknrW
 TSd+AgfmD3gAdYUsiuCLvFwqW9YzHnbsakXW8YZbTfR8HfzPGnNmdJXB/1ARJbc8wWOhIzGqj2+
 91YKN0urbxvV6J2wcsPIBh0nAGFb6oKGg4DL0uB4MyTAbE0AnXCDB5WXTzq3pXw9MMTj1ZIUSKC
 qhLrqtsypnb/FvnlWsA==
X-Proofpoint-ORIG-GUID: dWpfaWtAyfTZX2qQiQW_KVawaH8pkbNI
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b041b31 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=aa3sxGzdGyLt4iHDoZcA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: dWpfaWtAyfTZX2qQiQW_KVawaH8pkbNI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfX1y/GWDP58xrk
 W5WHlnch6I3Jt/ttUQsVWZTupTjT3wnYmQxNw8h8KIgQNP8+KLlI1s61lPX2ZvD8khw58zKktBP
 4lzNi+coFhtvAIadJbpkFo0xCnGUiso=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230043

Add device tree support for the LeMans Draco EVK, an evaluation kit
based on the SA8775P/QCS9100 SoC targeting automotive and industrial
use cases. The platform consists of a System on Module (SoM) paired
with the Draco carrier board.

The LeMans Draco SoM integrates the SA8775P/QCS9100 SoC, three
PMM8654AU PMICs, UFS storage, USB 0/1/2, GPU (Adreno 663), and
essential connectivity. A dedicated SoM .dtsi allows carrier board
device trees to reuse common SoM peripherals without duplication.

The Draco carrier board provides board-specific peripherals:
- Four DisplayPort outputs (DP0-DP3) via MDSS0 and MDSS1
- I2C GPIO expanders (TCA6416 x4, PCA9534 x2) and EEPROM-based MAC
  address storage on i2c18
- Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
- ST33HTPM TPM over SPI16
- AMC6821 fan controller on i2c4
- PCIe0 to NTN3 switch and PCIe1 to x4 slot or M.2 M-key (dip switch)
- M.2 E-key slot with 3.3V supply and PCIe/UART for Wi-Fi/BT module
- Audio playback and capture via max98091 codec (Tertiary MI2S) and
  VA macro for DMIC capture

This series is functionally dependent on the ASoC driver and binding
changes for audio support posted here:

https://lore.kernel.org/all/20261123072522.2358819-1-karthik.s@oss.qualcomm.com/

Link: https://lore.kernel.org/r/20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
Changes in v4:
- Add audio playback and capture support via max98091 codec (Tertiary
  MI2S) and VA macro for DMIC capture. [Karthik S]
- Add #include <dt-bindings/sound/qcom,q6afe.h> to lemans-draco-som.dtsi
  for Q6 AFE DAI ID constants shared across carrier boards.
- Link to v3: https://patch.msgid.link/20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com

Changes in v3:
  - Add PCIe0 (connects to NTN3 switch) and PCIe1 (routable to x4 slot
    or M.2 M-key depending on dip switch) with pinctrl states and IOMMU
    mappings. [Sushrut Shree Trivedi]
  - Add M.2 E-key connectivity slot with always-on 3.3V supply and
    PCIe/UART graph connections for Wi-Fi/BT via pwrseq-pcie-m2.
    [Wei Deng]
  - Move MDSS DP PHY supply assignments to lemans-draco-som.dtsi.

Changes in v2:
  - Sort DT node order: move tlmm block after i2c18 node. [Dmitry Baryshkov]
  - Drop unused sub-node labels ethernet0_mdc, ethernet0_mdio,
    ethernet1_mdc and ethernet1_mdio. [Konrad Dybcio]
  - Improve dt-bindings commit message to explain the two-compatible
    SoM/carrier hierarchy. [Krzysztof Kozlowski]

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org

Change-Id: I1ef390e8d1538ad58c74b8247dc6b405267b3d19

---
Gopikishan Thawre (3):
      dt-bindings: arm: qcom: Add LeMans Draco EVK board
      arm64: dts: qcom: lemans: Add LeMans Draco EVK SoM platform
      arm64: dts: qcom: lemans: Add LeMans Draco EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   7 +
 arch/arm64/boot/dts/qcom/Makefile               |   5 +
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts   | 990 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi  | 422 ++++++++++
 4 files changed, 1424 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3

Best regards,
--  
Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

