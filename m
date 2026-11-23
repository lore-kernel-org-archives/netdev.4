Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431223;
	b=jCXmMYVX0EAZCVOBEV65Tr/TTMGJzbMtS7aa8nAuf9Qc4NncbDaMg3rqeqlhOTj3buw/
	 U24E3il0ujFeq0vv756gaw2nC7hWJEUmiQ3Dtt+SFIAyCdlMoI0FPFhnBtRKpXa61tMet
	 4MzSQDFf3VEJ+cRApCqFrHOLkHYHSBExcdr0XIK+sRw6H8ngXRn2lpFZbA1qOSqF5yE8P
	 lae7bYYPt4ywwyEgSIysoEDjrYovqGLBzOyirM3sacZdcAOFdzQFApFm4H+xNhcVin4uh
	 d26N1OtnOq6vlRDJPi+h6W6eQ7ytcZcjkMFRzPIn5hKcnEyj8LdkAkqAWBasIRDwdZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
	b=piQdHfn7PI/5cboIKwPXSlc3H/vUr0vQJiYR+n6EfaG4tZ24nstPu9GrlLESNqLmKH50
	 N/wUndlcOlyn/GVxPGvENa9YwtgrlXhs3CdIsm+KLLfZEGlQzeRWqJ9MGxEvwTAO1kblB
	 c/mgasxCt3du4HOoe5RoaFdr7Rf9C4ZU6+i/eancxOHAkZKIoLmlvC23jJOlrx262xBKC
	 QrkVLzoD/FA4Q35Hg5Pa4qOtFKF5TX/6cAwYI69L4Ee0J8/XErjM+5od62rC9ykwdwO2b
	 i/uoyN+TcZX0wAKpy5VBNav6xZbXrYPHczyDKoQjm9Idcey1leCN1/2IJ3H3TD1nCHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLDhGM+G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dhx35+DQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5770D606A33E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5770D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLDhGM+G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dhx35+DQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G9T84095753
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=; b=GLDhGM+Gu8YdqAbv
	F0fXr/OprH0QQJSCflx/jY8SjE7/50uEBfu4VFmw9zY0Cewt5Hbp9eBFkB7eo+3F
	Og9m296OUHR+6NdIirtq0A7+kXhpxO+Wk2b91fw6xswhLDw0Pyt2cwcwY4dpDGD2
	58GwXVz3U63oJYPAaH/OIRJbCO2rSoLdk0YCww1cMpzy9+97jnjiODC99j7CMEdX
	76Pmys9aN8rhJ27vMaL51gaqwGtF5Bfr8siR6gUa77yhpivfEO+Aaou/Fqyt8gbP
	+b00gdOjIjGyh7ba9xN8i/+8/7G9lA/6qYuAuAOVA1/oa4Ln7yCCyBsSuqdNrrPW
	HWSCXw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g741160-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:53:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06750c74fso2281523b3a.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795431221; x=1796036021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
        b=Dhx35+DQ84T/CUoxcxt2wmpc6/hYmG9scTK3XoXR0GG0riyGELZ4mAHqEKoeel/Y4V
         B5PmfTk3YvAIk5mtlROEMOKdwY7Hxz0Q0iNGJxj21bEVkCmbsc6n/g5NxQ7HHdkhkFSU
         aBZMq0f/MnOnrxTiNEIRYSwhuvSL3bZ8soiNoPSjwvKqiIbYt95Wq2qkdxCtSucHCtUl
         O5rUNmTiUY4y5hlgxTxrMXG+gTPJgz+gHsHKfasGsvjKGISpi02y36P+1qHZE71eXuiY
         mk1fC1b3pu4yplE2d9E/MQnCwwzdDtHmvX2qZGST/DbxzY2+FfJFn7+b0yYKAdx1+A/M
         dANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431221; x=1796036021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
        b=nC4ELfX1oPs1Do6sVJX9cnotgkXG57UlblZ00md4xTdllVsvIjAmPJ2I8vatn0GNrE
         uolH6xSq/SpB8wZGa6/ZjHqr0W3YOkQb3lYuWa0Ba6rFrawadaCcKwaskOHrtd1BKysK
         N5cgWc/w3haPsln1UWZGDYON27g2CXMpREVm9XNiI7Hr3lMh2P7OOvuqUrKOIGBgCrVA
         tXWhXsD2cE9vhbGwCqVHDsgdyLtMyEhkpVptJCuk0BMUh/3wKxO4NR9FXXdNZdo7iG0l
         w6d7n5I+5WTl+5Fq5l77WIv1PQRFZd1+oA2VsQhVGJ6LwG5bLfic2s1kxFd87mQDWKVF
         vEPQ==
X-Forwarded-Encrypted: i=1; AL+hErEqb5bekHKYNTkGhq6tHMXBPkA06gaK67ivr4jsAKdKfqKQYd/1CtbO9bFg+Aa0+VUsj6qeXnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+22ri503+JZb9q9Ahdxxz46Fc1nb/MoK8f5gMZY7pvAOgBW4CZ
	ZCta9SWBScRYewMYOIi644oBgsDe4IVWhVhwdunsZ/8c+0QK9ZalSE+hmTTo+Kcp1wX+hf6R0m4
	hGhLzsVXT8rjrXAtIQzoxiql4gT/XyvRIMatwJIKQb0Y7z5NEB6P1DiOITns=
X-Gm-Gg: AZFdTZelVrSysxyjI1HUkSy7II39FhQUkmUoPOCSroEIGtePK7bEebHRqUr0dRfLD87
	VntqbQeU6MJ3TM552OO5Of7fRn5+3075vPAWeHCONUmygAFmucyw1fZmyiAOtMTcgXhHWsC4zGN
	OQIwQr85N3cAau84k+8KEXXwYSczB4zP33cAnhKw1qE3ex1X79eDL9Kqs6BVdNErNJejf5D33Tj
	d5s4BneoAAmzGn3YjPDR6P21U4UyiUVG2emVTUrW655h0lvuqvUz6LWeVki1hUOlobYk88e37YR
	C4OAfjpX55oEKakBE3pQ1jqGAgkFsIq+m+0t5w+49VxnKMPjVtTsF8ytUtjojdEO36UPr4yhmKw
	IkIUOEqVBp8muB7WEeX/iQwPzzVHVw6WUOrPDG94CZB3eL2hfeqitqrMyFE87KGLgehdXZ9sTrk
	opvyIWJwtNwUw=
X-Received: by 2002:a05:6a00:2c94:b0:8a9:b07c:7715 with SMTP id d2e1a72fcca58-8c8792a497dmr9325315b3a.1.1795431220681;
        Mon, 23 Nov 2026 02:53:40 -0800 (PST)
X-Received: by 2002:a05:6a00:2c94:b0:8a9:b07c:7715 with SMTP id d2e1a72fcca58-8c8792a497dmr9325301b3a.1.1795431220221;
        Mon, 23 Nov 2026 02:53:40 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e456a7sm5330863b3a.29.2026.11.23.02.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:53:39 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:23:10 +0530
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
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
Message-Id: <20261123-lemans-draco-final-changes-bringup-v4-1-dbfc15cd0883@oss.qualcomm.com>
References: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
In-Reply-To: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795431208; l=1219;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=J11m6SiF1xvvFn7gQOySTxQ2FArKpUmIzJhDjDucqOA=;
 b=v/JQPrZtMh9CPiRHeJ/1lQdAnsmbifrQ9YeQZwNf+toWfXHTY4kwDntqTOT1G6r7bgPxk7NcD
 d3fPqeQU97PBujMJEWvc36ZJ9U0LivjEAd6xOda/g4UFOD/p9YM+yeW
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-GUID: RkG4eHjUdeVdSnNtGYd0_mrDRMD0NCFq
X-Proofpoint-ORIG-GUID: RkG4eHjUdeVdSnNtGYd0_mrDRMD0NCFq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfXzrduyGVKgHvz
 P/lVhmHuIINyMJk3z6q/kEkHf1r063qejWhhpiqFprFYN05Od51B7YW/R75MYBTJ6HU4/FqAFBw
 vHZEUfW+8IwmeXJ2QLVnvM1dp0RtR8g=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b041b35 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jgbjWhLY81TnJwHp3GQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfX85xU05fg3fNm
 3Z79ONhz+ybQiUNKfQYY4fOXczcbJuPATj8Yz+BN/pZcc+gng+jgPFopof/5akmJlzTUa2w+kpd
 /6fWi1COnH5OTSQSmYXBiYuztMbmaFlSeS0XiWavRTIflVAK7VybrwdjpE0wGExJLZr9zel+qqB
 zVFJcSplnk0LRJ9s26/du2dnkzwFueN+U2X3pvWdL1TRTy9lvTTwT8JsbtJQ32KT4ihvXY6WC6u
 WVSr6pOvWwW+Y7CYt5vNG6Stt4LrvK1mkaeH7JnKiygahSD+VALSPDgIn749H2eT6EeqiXRTyOu
 1lyAiBuyl3EvK+IWmD/OuTSRaJizkuchWvCaB3H4vkcu/1Wy8vobvoMpsM4eJU8PZwKQ93RA8Pj
 mfMan/T/JMqGtdIHmDB1fhJnKQUV6cohsR2y9SOIhxgvUoC1nhaqPz8dMeLdyZV3s5Siia8HVGV
 AIUNosApRzked+3zesQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230043

Add compatible strings for the LeMans Draco EVK, an evaluation board
based on the SA8775P/QCS9100 SoC family.

The platform uses a two-board design: the LeMans Draco SoM carrying
the SA8775P/QCS9100 SoC and core connectivity, paired with the Draco
carrier board providing application-specific peripherals.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..3d63e797cf60 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -545,6 +545,13 @@ properties:
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
+      - items:
+          - enum:
+              - qcom,lemans-draco-evk
+          - const: qcom,lemans-draco-som
+          - const: qcom,qcs9100
+          - const: qcom,sa8775p
+
       - description: Qualcomm AR2 Gen1 platform
         items:
           - enum:

-- 
2.43.0

