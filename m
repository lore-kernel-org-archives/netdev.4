Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459328;
	b=Rfi9v53Sus3IDmfREYtnQkUCggO3Ix1jcQATfZFAzo7V4zB5xe7B1E9zu7/yDs9BOrM5
	 whhiiTq2tWMTLszGuEVhiSg/DdRk6F4DD4YA+WfKYGoGK9uYUGxOCd3ULmq3MxhqmfvC6
	 lcJnHHE5XWBPdZCIUtqBf3j7tVtcK6RoloScgUjqU2BW5pWjTtCCwe3q38CqWu12gtdZG
	 2stWTVumb4MY+mQKo3pBTmhVA1P4+C+uU5G8UW9fj9tkfqunFPu/+ilfQLre9lESGpQBf
	 2z4MIVQrQ/ulpskDa4qEf0Hiv5ETiBHVD13VUI6Tl9bd0PDhzCeO/8Oxa0iZ/AHuvKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459328;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=svF14fRerx1BSkQmBrzjUcfz3cY+DPEYvRHCJyqzfP0=;
	b=ejyFFFeUS1ZKHW5JZEjMA9RmM+pFNrXSwULcdTKZsjti0FCwLZG/PQY5WuURsG9Kg92l
	 LIUzsx3/gkcSy7JYkPSUsnTysICYLdb23D+2v2SdxIppDnRaAM6vooqJA6NsNFAVlPJYP
	 P2CtM0tPB8UFY65MpLrbmVCSO+iU0z1PjUyXkcHCum70VMJYG+sJOHCrm2Eq8lJYresp4
	 fVcqx3zCBYsr+K9Z0BC1Pfiju3W5XWbRB4ixhbLCEnvZHHaCZFORrnPY5FVExilB9q4qi
	 4Ayc9CMOPD4DCjEqekObZ40GTBvtxaJCq7OkPsRGphoehhK7UcLYbPTXxiiEf3pCfxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XzqhkUp9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LPErswG4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBD6606A333
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBBD6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XzqhkUp9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LPErswG4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH1Xr2377356
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=svF14fRerx1BSkQmBrzjUc
	fz3cY+DPEYvRHCJyqzfP0=; b=XzqhkUp9yxvizDH9n4WZ3/0ohqJSDyqGA8tknN
	3zLIxR5uhk8TsBb3hF77CAM8Ld/BYuYiKQnXLU2cO+xeYSq//UZdKIsz3KAiQaLh
	Zf4rsbP4yV3AuqtdJXtY07lhuLom/TZ8L+BINN+n0EFAeYsNvYvyNOTxIORHUW67
	sPbG6URbRRUNDzRCGrxXXIle99ORpnNgVMqW7QSIRGf+Gqtux2sEn8ZrCoKi7Hf6
	Ho7JbPweu4e09XLawQjH85jwWSpUz9JhqtXPDJ9LUxCWcYhhrpOOW5nTMaXrNDd0
	tiRVYp90f55m00LeBy+1bHc4C+t/yfU9rqKM1N7O4GoSp09Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7usvn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:42:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0717e54b0so17636045ad.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795459326; x=1796064126; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=svF14fRerx1BSkQmBrzjUcfz3cY+DPEYvRHCJyqzfP0=;
        b=LPErswG4VALl86QOLSwsc2Q9JzvxIPfHM1wwO+tPtPIllNL56dVBnFua9WXP4i+vJi
         p77RqO7d+wqvgxT/rzbaw3Lhn1RLTjwT9EIfW9k7f6M6szaVUTqLQKpyQmg1z/K3Ol92
         bnZ5gMoRYPJx5vqAUKee3Cg0B50X2vcHa7oJvyk2EwrCVh7/D6fEM9qzIv+aZu4aXAhV
         C32vbieACYNR1EkUnQRqUX9InMI+H7WCfu+gqLP4jWQ3rSrSDOwSxScwzI9VT5uG8NoD
         bexiIEBq3MuDC7jzj8Lf+FfIYQGvgWx0+VsMPaJ+bj5CnlIZjWNsu5hxnh4GfYTO93wP
         POPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459326; x=1796064126;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=svF14fRerx1BSkQmBrzjUcfz3cY+DPEYvRHCJyqzfP0=;
        b=SgFU+x7/rC/ZiZntuVV6Gh4Sen76c3rB99oOC0QnO5hK7KsL1j+yiiEgmHwrBIw55T
         qP5BUHcblkFpPwl/MnoHBcyCIGYqJsOHaFAi8N5hUQcsvgUCpiCqADG+dQvBwyaa9q+2
         V+I8SpKULqjLxW+wULn3m4X7D30DzeeccbwH2f966Q4WEQk9+51eQtKt++vLvdG/MuVq
         I5NS6OtN15acpnKFbsREIczWq+EGjXGy46JZFGlVudybh7Bztg5YmWA3A5ZJZoVsjRW/
         hpg62USqvuQK3rHKt9WzL3aLVhr21O+8MvFMM83AVXdV3uBijicARtXYykTOBO6/cOOs
         r6/g==
X-Forwarded-Encrypted: i=1; AL+hErEXSG/2ukoRIgMgaz9gUKBsZwSYR44ZrEJpP6GtKdpZJbDcgLqtXtbek/oNRhppWeww5+jkLAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9951WUZjJRkpREkw1ymuCAeySgF0mijYluaFyNFegQc958LqV4
	PmNbFtaQrV+5vm9kgnK4QhIIihL5lYfmHSj6y+b5rL0D4It+mJN7Ccff7tHp9gk7yV7rk+d4A5j
	AiBXdivyw29LIEIn6jYBzWdd9Smm+Y8qXfjs/yirUi+Emci5wyTOS95t635o=
X-Gm-Gg: AZFdTZdr/QcuqFfd/ytKleu5jaFKm6vS01tkKnKSIvCL7hoGc51hoDCXHLo6gtmbC2Z
	GSpeBVSBGe66gI6E8dJGrYbg+6204RskyBEvjJBv8a7R8yRTzkiKLAMgQDsLCJ4mgxUY28itdTs
	jWZJJnQVLxWgrB17miLVrEw4Hw/+Jowo8R2oMfN5rTIzVtsAVac0y/CHM1Cw4foD9qn8hIk+11z
	QfIp9Fa6sv5a8KQTEW6N0auArPc9HaV17UUzeiGUpyg0Q7vVC8vcttWHrO5p/obWBf0n010hBSR
	+xroruXsO7UeRqrxnaG4yNtaa4g5xSeRuxnFrSzrGWjH+WFYZlBta0XaRdhgH5Bhtjce6h2PUaa
	Kw1pfZCqmnGua3LZdOyRCd/30S51uKnZwOizy5CzKUG5oYhGe1BQieY0ZVr933phafn/1mdNvk/
	Ffoak=
X-Received: by 2002:a17:902:ef4e:b0:2f0:4ebf:84e5 with SMTP id d9443c01a7336-2f04ebf8708mr112150725ad.45.1795459325388;
        Mon, 23 Nov 2026 10:42:05 -0800 (PST)
X-Received: by 2002:a17:902:ef4e:b0:2f0:4ebf:84e5 with SMTP id d9443c01a7336-2f04ebf8708mr112150575ad.45.1795459324872;
        Mon, 23 Nov 2026 10:42:04 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c7dsm57984705ad.55.2026.11.23.10.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:42:04 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH RFC net-next 0/2] net: stmmac: qcom-ethqos: add support for
 RMII
Date: Tue, 24 Nov 2026 00:11:44 +0530
Message-Id: <20261124-ethqos_rmii-v1-0-1754643d593c@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAOiIBGsC/yWMwQrCMBAFfyXs2YDZlmK9Cn6A1yKi8cWuYFqzU
 Qql/27U4zDMzKRIAqWtmSnhLSpDLOBWhnx/jjdYuRYmXnPjHFcWuX8OekoPERtabv2mDlyjoVK
 MCUGm362jw35nIrKNmDId/1Zflzt8/g5pWT5JJwbmfQAAAA==
X-Change-ID: 20261123-ethqos_rmii-f929c84f24e6
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459319; l=3039;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=Eozd2XBF6qkMrOFBsjC0iY8JAZG6nfTTy3vV5qFG3G8=;
 b=1/sjeU+R6y4z4oLE/0FhsjtnLl2ubfL0fg/7N75Gszao/o/5Kx4DkrG5BCFQt7g7t4ZIhOFHM
 KS/LQkOhiIWDPSFTNC1ObzAVDYpjjA11n/qet3vUye1jWdoYd+H/0Ib
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: vCvwY0C1nc95OucIqSEzrLC8nLhn4321
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b0488fe cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=8b9GpE9nAAAA:8 a=EUspDBNiAAAA:8 a=fnaMMcORItm61ZtTJu4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: vCvwY0C1nc95OucIqSEzrLC8nLhn4321
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX/vS1enih2aGA
 V3PcG28OgfvpiZh3v4oGqYek9jgY82AyrwhJdhP4kIwXhNEtyPPEzUqxAtlz1jnUd9FDAGR4CD7
 FDSJD6siAf8aaabQXTtAO27ejt3i1JY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfXyE4A3hF6435t
 iwPbFlV+ZOfVYu948Bhdfqkv2GHPxnp6FBIAE7oEx1LBdSFaakYX2MkZNZt6CTu3YAoTJ6yYpY/
 O+IckCOwOmOOgDhXmevQYwY0MSMhbG/IIyPfRb60Eu7hQCAwpyd6usaGo1iyLgZbevFH9jiQRZl
 4zKdqmSUdMu3Qec2Dg5yRKEROLDRFihzY9gKbL+xZytkzzt48jrsMs53u4dnHiNQpFsGN6v+QUh
 RoCIaeANzwJx1UBeCHupeVOLbnJ6+Er4C0IQAyYSSllvj2/0sacXiDjeAdlHFielIQNRMQrlmqA
 hnFF/xDuXrdXKQ/6ncUm9MJjs5Jv0cuHtWBAzOUev1NiQpOsGt6nYr0yajOgcrHfQLTOEy90rMW
 QcRJIyY+37KfPEEQoVgvRW7oCX4RQoUh0pNEajlr762gIRRhbfwB3IYbdO9RtGFPbcPwgO+NkPK
 oX9etWW9Djxhy/ABozw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230074

Hi,

I am sending this RFC as I am looking for some feedback and inputs on
handling a HW quirk that affects the RMII PHY mode on the Qualcomm
ETHQOS controller. Maybe someone has seen similar behavior on other
platforms?

The Qualcomm ETHQOS core supports the RMII PHY mode, but only if you
ignore the dribble error, which is set in each receive descriptor. The
programming guide provides some details on why this happens, and an
excerpt is included below [0].

I initially thought about using a platform specific flag that would
ensure that the dribble error would only be ignored for the qcom-ethqos
+ "rmii" combination. But some digging pointed out the commit below,
which does something similar for norm_desc.c and enh_desc.c:

  commit 1cc5a735185a963ed9324a65e1f2db02bf52c0d4
  Author: Giuseppe CAVALLARO <peppe.cavallaro@st.com>
  Date:   Wed Feb 15 00:10:37 2012 +0000

  stmmac: do not discard frame on dribbling bit assert

  If this bit is set and the CRC error is reset, then the packet is
  valid. Only report this as stat info.

Apart from this, the wording in 802.3 around "Integer Number of Octets
in Frame" and "aAlignmentErrors" specifically calls out packets as
being error packets only if they do not pass the FCS check, although I
might be missing something here.

Anyway, this series has two patches - the first adds logic to accept
receive frames if the dribble error bit is the only error bit set in
the descriptors, and the second adds RMII support to the qcom-ethqos
driver. It has been tested with the KSZ8081RNB PHY attached to a Shikra
SoC based board. Since the programming guide mentions a generic
programming sequence for all SoCs, I have kept the platform glue logic
generic.

[0] Here's the excerpt from the ETHQOS programming guide (paraphrased
and shortened):
In RMII 10/100 receive mode, differences between the PHY's recovered
clock and the local reference clock can leave data temporarily buffered.
Consequently, CRS_DV may transition at a nibble boundary near the end of
a frame.

To handle this, software must ignore the dribble indication, RDES3[19],
while processing RMII receive write-back descriptors. The dribble
indication may contribute to the descriptor error summary even though
the complete octets and FCS are valid. Other receive errors remain
subject to normal validation and must not be masked.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
Mohd Ayaan Anwar (2):
      net: stmmac: dwmac4: accept dribble-only receive frames
      net: stmmac: qcom-ethqos: add RMII support

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 49 ++++++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h |  1 +
 3 files changed, 53 insertions(+), 1 deletion(-)
---
base-commit: 5a1f6793361524314b442371dc05ce3cd4f2f838
change-id: 20261123-ethqos_rmii-f929c84f24e6

Best regards,
--  
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

