Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981783;
	b=YDQCeTQBJMtAsi7ueVav9S0Ezh9OAktjJ6M5dtSN1n1MQ4nUmBuS2nwdEleEIraMxhUw
	 3TKEpu3o0lNRSdrnd28ArSlAb7E53f3A755CcSsBLaLI325Ul2maLYj2rKUKq1nohbFpx
	 8pXQUwfyr0HlXZvtHq3kkoqefUU0oeZWniBB8IPKrc7Rx9UBqthEbpe0pBldYGWXB+RuI
	 sLeu1fkv8gITflqe5Xjc8JLNJO1aorSSB62BEhAzW8Svizt8yUv/02NUjkY03+4lR27Ud
	 jOI8BowvwUnW+NgoZ+KDwMbdCxc2pxtfolUyKZ/aeJyOfBhRhEPynw8T6Ugr/uN2PbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981783;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=;
	b=rF5guCQuMwGbEML4b5qxkC7wXwxOdxaXacV6qc5odHL2Tzyq+TFsE4AnlR8UVuq5KG/Q
	 C9yn1Lw6KmLY3Z9a62O1uaIXQ2jrcA1q6gBA3daeRITgs7BYku5vusj/Zr8ulzGCRdk0d
	 V7WrPzQSfkfG2sauDGiauk7D4kIbZoSZzh7P6Vj2kd6HvCtb2xECGuwDcqlACgp5m0jbC
	 T7dcyLNpm3oIGAP/59WYOl8uTfrZNFcw3Ikc8y7RoDKDzuBjhjZ7JCW9kMLneKl05yL1i
	 6qjqym1VT94c2qUPnqNdBI+Ofkx4WEfgM9HWl/wT9lPmeotIjRoV6brEuyZNXqoTB1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KtnQKBgr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cqSaMUA9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0C7606A32F
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F0C7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KtnQKBgr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cqSaMUA9
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UvvN2453546
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=; b=KtnQKBgrryNKBV+K
	X14+Jy8gx3M3wi0BzySspud7Y7foqX/OEzl1X/cQccu+jSSLNyiwPc3lut2qiH79
	UuCf5pp6ZQ2FpMbZtMYGOIYxHzbAbY3g8AXIgQ4kOpeH2INHnwMgnabjw/KOv0Ph
	JrILVHRbu8D9R9c0dmrksBf9lASahSU3ShW9EtDAq2GI0nzvteKfSYSDg0/A0/VX
	u0f1d51bFgyIb+3ANe0rF9ax+WkUSJ45LZ0YISqX7aZoDDAmQvgQbGVS0AddcQv5
	+zKWf0QcSN8OpUXar9hJMHap2Rr7aRB9P09cSkEI1O4toDuDr2buWovgkrQzyOUp
	G6F3ww==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99eny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb86c39250so449903a12.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981780; x=1795586580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=;
        b=cqSaMUA9uL5CmhqrYBxt7AAQIG9rNzJ9MjcR7IwtnhnA3iZ1WUKruQVu+gQNJqoioK
         drmMwCGq6j0+bCt9OYb80NNi/6SGfUPsDP2fFgWh1dejluep9CoMhqspLtbEtdpYw0kF
         l3Q12u3fDmUqsZ7W4ar0tY1rihMyDzdcvX8+ez4lsgDBYpjxJSNrIyVcbzbEI5xyobUL
         2bmIDt06gudh+HCKne0QgJymDIo+QJ/LkyITJDnIUAx1Tbnfx1/APQJquTgYUKZd+YR3
         lnt2V6+o5oIN1qhi0jdUNBHnW8dQ0wdP6HE4e4Cp3EoFvvZN6ldx1thKDDVNSu2KUq0p
         nC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981780; x=1795586580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=;
        b=bX7t+hM5h7OkVBIIR3GM8ehdgzv/82ZdsuTVvzhMQx8IBAFAlKjcfgkyHlWVBOOEqt
         RqjHusRrXbl41uqP1DoL6rXxmOmuDIzs29bYsb1gDI6ouRPObXADTYqOcnrYqojNnQBO
         vSQPwNCuQQtFwZZlvzWTkMeIoLnInwafMwjkFamKY8W6cqehYTr1yk1ke7gUmVP6RPvl
         3sSgmdwXPZBeoZZdyvahWKSCZbEZzhFh9zj0qrowP5CjPhoZR/TD7ygdGfXSn2UQuG5m
         7wR4xthA7x0ookRQmoGpFbJo4ZdAsxJoZyLfOvPqNXDPtkruZnIYFmjzpvOnTSatgbHH
         TT/g==
X-Forwarded-Encrypted: i=1; AL+hErFhSdCICyBT/y0D2/zNMR/57XBVOW9Xv/YHqOCWyyV8saxh8DXWpIkvhiaCuf29ukomTKoq02I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uzkVcM3a+VYDsBHv5FMQowlS909s6OyRZ2nFV4kGkoR7SQpkX
	2tZIviFXVY9trwyK0KqiY5KGF65cVn1U9PFi+XmPxviL9n9wiLGXJ0wuvpWwbfeok+s7dUQGCus
	xPNKHtbxrKsQkFUGnfgnHT9OJYAalINZ+kNgOH/6UDjFYa4TrEtEBDJHC2cQ=
X-Gm-Gg: AZFdTZdQ9xVPSnOVcI/FOs3GGrhcfNCXZlf4eTeAnTvIKkZ9u6vd3w2P9hZ6SS1NyBe
	QhvriZh2jjmsEfA2wI/Bjtb+VA5j8t6IqX/tJN5FGa6hDFVcqJK4oshoJABvNbJd3gYLtXwJXee
	1KuU+tljxrrJ4iQWlIJZpMc1nTsdKoTIwAKc1XOIlSUpZ3P4u0lQox28huyCVcGrd0RN0m9MGFx
	NkQuM2hErm+UhX64W7RNsA18J6iFjKFCU2pWZgJm3h5J+TBGvGLFkUSZnI+pKz9qyREzf199vF2
	NPZUIUKMvxIbcPRm9RjqGWatNlmMqN/fLkAgcOQGAH+Q3B/GJ/avIYzypcKI1J5SrGF2UeTgrC2
	abwtWt/suV11fv+V6RlNxFkaZQVPetCT0NyWDcyVt9Qy7kk5ldT7cxcj061A6dVao6PvSV1pnrA
	==
X-Received: by 2002:a17:903:1b04:b0:2ed:205e:eac6 with SMTP id d9443c01a7336-2eff751fdd3mr13780855ad.39.1794981780167;
        Tue, 17 Nov 2026 22:03:00 -0800 (PST)
X-Received: by 2002:a17:903:1b04:b0:2ed:205e:eac6 with SMTP id d9443c01a7336-2eff751fdd3mr13780565ad.39.1794981779689;
        Tue, 17 Nov 2026 22:02:59 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:59 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:34 +0530
Subject: [PATCH 03/18] dt-bindings: pinctrl: qcom: sa8775p: add gp_mn
 function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-3-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX9h94eWLL+/GB
 KI1JanR9IfIyTtVrGu2Q5ljchwEDsQoHFsq4P8fBYyUMHqEB+qQFqrEzB95NSp4zzI7T8kf/lya
 LI1KkmtPLc7cmjmc+CyDf5QJ1be2MUw=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd3f95 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zDgi9xSYwh7u5fUgZvAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX0zsfdbByP/Lf
 DSZMcfjphJh2sVDKfXiUNXS0/i6VdCVYv20OIrvnq6pJumQjinuinEkCEGOPIK7TqUE1JUFOR0Q
 ciSgXw+5c2aFGejEt3vJdrWt7rsewB1dux847VZgn0ZqriWGYnfM6+g51a/6ZnFB+qkkM8aVk34
 vI9/VpnKeu83sGmSMY+kocoi6x++OFPy98TEp10hM7lSzHUYZE8YiHtOajzi5Ev6M2XMF+zQSJO
 PtdS7qyQA+HQ2Dz9PczKnMs+mTEuXn+a5vKHrckVGUaAZAlPFS6SEXDr7QObwIIegTTjQyE0WWY
 /1mtjbfKLvjE5+pWrc3aQTTHKI8WlXMS7Hzf5zF0rbwzcOg1bM9uH9K4z46duPAk66Lmn1ZjMia
 ujupEOC+x3DLD2pNHxZWnYXrioAbNTsBIb5LTUDuMIkhKSAcZNof1o2cTOyx/itVEq5/Z69ks8K
 o0k7ESgOf4qN9uFUyMw==
X-Proofpoint-ORIG-GUID: C8kvrLTKjShEcss2SRsXo6Xi6pwaZuDh
X-Proofpoint-GUID: C8kvrLTKjShEcss2SRsXo6Xi6pwaZuDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the SA8775P TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio35.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
index 7a156b9bfaf32909125efc89e27f8dc671909964..1100ddab52290093af87250e4181043e924497a5 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
@@ -83,7 +83,8 @@ $defs:
                 emac0_mdc, emac0_mdio, emac0_ptp_aux, emac0_ptp_pps, emac1_mcg0,
                 emac1_mcg1, emac1_mcg2, emac1_mcg3, emac1_mdc, emac1_mdio,
                 emac1_ptp_aux, emac1_ptp_pps, gcc_gp1, gcc_gp2, gcc_gp3,
-                gcc_gp4, gcc_gp5, gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s, ibi_i3c,
+                gcc_gp4, gcc_gp5, gp_mn, gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s,
+                ibi_i3c,
                 jitter_bist, mdp0_vsync0, mdp0_vsync1, mdp0_vsync2, mdp0_vsync3,
                 mdp0_vsync4, mdp0_vsync5, mdp0_vsync6, mdp0_vsync7, mdp0_vsync8,
                 mdp1_vsync0, mdp1_vsync1, mdp1_vsync2, mdp1_vsync3, mdp1_vsync4,

-- 
2.34.1

