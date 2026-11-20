Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170132;
	b=g+JWQXWgP0cy4Ns8pCJdVh+9Xz59yq0BLBOasS0ZG+gNBQfIGAoH/EaWeBo5HuEowQib
	 dEOudjYINgCcM54PLWevie+fgpLHdEibyk1CNSpd2HUSIrRP+FHfbPHpU9KvLf4E2Bt/0
	 dAWeyUicNG8sk2YLpP+KUhS+SyZJwfrBYGm9B16Z2D6TzIelSCUp3yNAt1VDd969uuULA
	 jT9A+N1fLkCuJ8jdbCwPwXz/eQ8dx1L0zdWYvPAJtwhKmi3aOz05Vd8+Y1xOIiUmhd6E0
	 Z4DlFncIPIWMMhrOmPPEkiPChXkRu5V28G2+KgeOiT7meixmz8SFPzcR3bPlRBnt/LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=z1MGMcXxwJZ7aC9YYQ26OH+G9qkkBjw1QsP0VNbDjno=;
	b=bb6H7iSS5pkMZZ4jT2efICIHN7gbi6ivoR8Ldf94nuIlDy+uJoCJA56q8joaMjc2PoCJ
	 VRCp63kLwzXckduE95hMbxZxHOFtR6VVI8l08PPM9Nf0JdDWacbbdCGK+RMiMwYGWaQEC
	 6wqtPD9ERSTkykJOgQzgAv5/Crm54hq7/uYFBo5XQ1C18/T2CwCcl+km0OtN70W1Eo8n2
	 wqkSjG7BHBWoN7uThzoiTDOM0C5xJKUF9mupps3y1iXZrXCXOO5ht8Q8c00Xov9F0KxEW
	 IZuwWyGsBfyFFv5Va0ICHOQkfTvCo0j6SbhdUYx9mo5NeHCPRS9TW0ORtgXcz/74ACQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEJ2Qkek;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eWOo9ers;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE6F606A33E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE6F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEJ2Qkek;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eWOo9ers
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f1HU1742046
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z1MGMcXxwJZ7aC9YYQ26OH+G
	9qkkBjw1QsP0VNbDjno=; b=YEJ2QkekzsvzilqybtrIOF17/qu5tiMJz5gYXq2i
	HFShxDd8O8TMOBOkrs7njtl6bDfpWdwuKea9Q24JMTx9P8lJdjWKehmYDU+PNtik
	ztS4KTSOzgkKO5nylH2EMOUPcfTU8fyWF67Bk2oHWAss21DgNZ/1kF4AC7AwIUmD
	05HxTLs/r4sTBFOOgNwI8Nj8TDohDLI/1aA3EoAfdvWx0ODmOeLTH7m31aSEuRBf
	ihQal+uRFTomuyo+Tas9ZZ8zKZFG86yL3lk5tjOoglZkI8UFmG0BiTrIWRRX/4cg
	mqTjVlIDiyWg4hjDu/Vw4MluqBu3qEvAufJyjIZHNmDz1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhdfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:22:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5363fa3d3e4so14324491cf.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170131; x=1795774931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z1MGMcXxwJZ7aC9YYQ26OH+G9qkkBjw1QsP0VNbDjno=;
        b=eWOo9ers7osRg2E87cOLSOUzN9Mr7Qy4uMu5swGFJzBnqLl4QHUR2FGhMYNEDfRnAS
         VCCvW2Lhb7VD+bo9VxG84uoGq0Dp3SCQ1zI6dfxLshkb+n726dnJM4DqjkRv2hoDeO3A
         rozocKOY1Lwn16dyFg5l3obFE83VeTD1gN7+9Qq0ydqbeorBPO8BtT7xcwqPxcPbBGdI
         bOfEk8DspeUd9fyQB7UyHM2gAZjdHCNZtAp8ln83ustNec6D+h+EPly3c3BaCKEXeLM1
         3PmRPpAVxsDmQx2vQjIgXGBdH3ZE2THQD4ZUyVHKTJZ6gRCUchj9OIpBscglP12kZD5+
         KoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170131; x=1795774931;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1MGMcXxwJZ7aC9YYQ26OH+G9qkkBjw1QsP0VNbDjno=;
        b=zV1HgVuVhkVrIQ4p93EkxkhwN24j5jLncuJ/8RWkl5sWFwjog7blFZQvx9hyncStq4
         iVa2GyCG1tRCH8IzVImahUEXrF3HabILOiNdx57pQHMXr2SNDAgkkV8WjxJispMFOUd8
         SjAt5hCEbDczG5gb5+TWDlKlISOpKffQAgJMdLfDKGsVr2T7E2E5ntOl55+gCH7lzp1U
         Zr8PUgtIKliM8FvYunQi3lfhtt5yYtLDt9qPQammACUvv3M+JZwaLs0+m0GDlccvkgLN
         jGnq37h2mK7Mi7pSLCX6j40vlvvPeMt7pi0Vn3v72GhFoLF84Aw+5VV+QCUEucmrFKIi
         77Yg==
X-Forwarded-Encrypted: i=1; AL+hErEpken7yjHHvnhXoHh0I34yqA6b87/Kh7E9o1Idp1zDlEczJ2tWecTELReq5/5jBp5IKHLTIr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wjK83PxU07+ZCqOSCAMdv8ooRaTh16yPfJB3tYvB4NQCFEoCj
	TUKDBSxHmyzChqUj9IRv+jIMzHKCZRPDCqQ1JDZ2EKLw5AFi5f1Qt6zkZnRACNTgCP2nZuHLXgj
	frjT6xkQ+zy/OuO4rbthsloib4ez/73laWdycj4TvAzyPBcgsU5EoATB2svI=
X-Gm-Gg: AZFdTZfbwEeujHlm/ihr0tuPEfChMlzBD2WGVLpxAByQvY2yxpqqZHlbKaKWznruFnm
	EKj89/8r5A+7ppTX1qWBbCNZZw9456zE5jfZ2I2R73i7CyeSUtcWLc26O5Wx9+Q4/09MlIe3ZkR
	h7bSHckDYSewCDDdAG6hleshtXCNnTTI2Lb8EQ9okqaWFCf8upL2bNT6QXh8gkXbhk1gKrPCLKb
	6QuoczBHR2sOmCxxcXHRpEcSXP0+JGld9Zp2yJL+KDMAq87QVLvC36er7YwfD0fLyZ1CDhyBPf7
	1W69smMnaVFqU3k/fFln8G8IGedCm0t+7ownqvUwR4zmMQm+qEg22NUz3BDv4FGsDJjqp001xLo
	nk994jheqYZY05G1j4YewYafTfxMQtExOf1jCK1CD/BM2ocv/2spc7fBFBMbu526X
X-Received: by 2002:ac8:5ac8:0:b0:532:c057:9564 with SMTP id d75a77b69052e-55d76a2782emr47563561cf.23.1795170130535;
        Fri, 20 Nov 2026 02:22:10 -0800 (PST)
X-Received: by 2002:ac8:5ac8:0:b0:532:c057:9564 with SMTP id d75a77b69052e-55d76a2782emr47563001cf.23.1795170129811;
        Fri, 20 Nov 2026 02:22:09 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm3906179f8f.46.2026.11.20.02.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:22:09 -0800 (PST)
Date: Fri, 20 Nov 2026 12:22:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: ipq5210: Fix xo_board parent
 clock
Message-ID: <gejgvl5guwsdfexjqnq7aafesxjn5tjo5xc6ireh6xxi3mkt4y@si3fqc4hj4cd>
References: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
 <20261116-qcom_ipq5210_nsscc-v3-1-1eaf92698379@oss.qualcomm.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-qcom_ipq5210_nsscc-v3-1-1eaf92698379@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b001f53 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=M5Hs6WqG2zr0kzIIc3sA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfXzYjAC0XxZ18j
 mzXLJs709byqYYZTCAp0KQMaLEE8vkXAfOhYNUBZk4IeVasiptx42oxbwMWke3SWx3L0FIqFosp
 0MbRg1JtC7GZudT0iYQRbCGGutVLuyrwIbszXOErdJfO5J315iCb/q+RgZoPa1mWVBQTkNPDvon
 stkNNuZy1ajnIaJkBdGy7qG0d/l+ua79bAnKRAugGFHGkjbkffLyMOlZrNCRq1K69NAa/u/eouU
 BFQn0Bsq8FEOlDTPNnvTvoTh/Q0qJxR4pAINmEtKRa6uRXRUAjr9lMzxbnAEFAw8csa08Wrkfbs
 wZ3Yad4+wV3NKPPzHghYk2p9Pp8HhQGMvKcbGcgk9lZBoF7j9B81Eg+NVA5FWQMJJV1PrwIbNmJ
 ZB49fjGe4RaCloIw3Spj62SZ54TTkmhD6j4jqoIdedSwqyf4kfjUhpaBAIY+oCLMOYDA3HMPQP7
 w2Ux7fi1s43M8bZmNqQ==
X-Proofpoint-GUID: 7c6NdYBrR4SvJGsFKMSLoz6KuMmbRUio
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfXz0pcjPAGakot
 ur98VPMKh+B81j9dS4/CAU2cq+YnrRpujlU2M32bxbbXo4XStlG8sZzVdpp/4fvO7ArCLKkTjDX
 2NMczePgHY6npdg/a7OlvaHflmHaySg=
X-Proofpoint-ORIG-GUID: 7c6NdYBrR4SvJGsFKMSLoz6KuMmbRUio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On 26-11-16 02:19:48, Luo Jie wrote:
> xo_board is fixed to 24 MHz, which is routed from the 48 MHz WiFi output
> clock (also the reference clock of CMN PLL, ref_48mhz_clk) divided by 2.
> However, xo_board is parented to xo_clk directly, bypassing ref_48mhz_clk.
> 
> Parent xo_board to ref_48mhz_clk to match the hardware clock routing,
> There is no rate change, where xo_clk is 48 MHz and ref_48mhz_clk is 1:1.
> 
> Fixes: 1d6abd242b45 ("arm64: dts: qcom: ipq5210: Update xo_board to use fixed factor clock")
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
