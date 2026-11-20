Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170077;
	b=hylIJ6UgH6zW00yLxmcgTjcDuEe/MHCkTb82DWNQnSAyQMpyvlIbRISJshbKaz/MHibp
	 DEtPlX3VQFCenr4d1Nlpnr0Xhyh+NOqaaBNO2m0fBwsLZZJfip1LgKJBwKKlffYNNKKrt
	 Ebi2cx9YrHo2vI6xegJNGqO7z9UukjsfNS9w929/K8li9nZxVdsZRv8P+2rb6SGlbmc07
	 dAzRkx7t+SPfw8cPoC2qLAf/Hk8rmHdfOMsLSTO3Cmawa7bXZ34oKPJ3cvEkVO5O6Xgp9
	 dLdQ9PclkoqZP9Bh3Z/HT3zDBq0gP1vTrRrYAf99cfeGbze9T78LcveU4WFMttGXA0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n6xNjiXLI4ldZMgm9vuyivlFeIPVFifPb1EDl7UJecI=;
	b=iUaYLlQwirGOgJTBzg3cvWlIJGwnL5YMDTiaXdqxyDncUJl0CaKG6/3HIhIAKSbuvO6L
	 L8RgaxefmPeM2QxZgKIvSn7CCnj/tFDZad+FVNxPphuX4N3SKrPxk/t+9QxGl6G0sx0Yb
	 F69x4+F49vlQd8wAgpNKT6eghrRnM8WlziVANL34vMWmfJt7CTdQ2sJfltjqbvWWHH6Ig
	 nkea/pzZpts9xiT09BF6GYG7EF2RRJ0xtw6UyENyn3PdXyYu4N8smM8EXkfdACmwAIVpt
	 0AbVjBueUHzGR9uI3xftd0aTFDxdTotDZsHqwL4PNsOX2V3mmBzm3nR1fIUERFUx0dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiQQmnZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFgi5Vhs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62E7606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E62E7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiQQmnZP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFgi5Vhs
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fDh83320732
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n6xNjiXLI4ldZMgm9vuyivlF
	eIPVFifPb1EDl7UJecI=; b=CiQQmnZPTzu9L41uX++xGZzjLXHOfK8Pbf6a9gvv
	1b3ZmL84IQyGNMUUyQXpRlOPbv7v23GfD3cD4qderzPHqcNp0Sc/RelCW7K0YnFX
	/qBmQ19QNwi50g8JyAhmj4ClBHBEIfm2trb5SjhaSsUNBbjYrMHa1AY8TIuAAnM5
	dGgwM3Iqw4Wul05TOvDuZvhfKvgPydFUmoi4yje0wedMFLLGtlkH/UpG3rOu/kNA
	qSS57tfItpUDX1QVfovE3k692uv15pkjeWBQ5R8C0Eb8t3Jpk2ENdS37v8opHbTP
	5BuRybzmncizaSw8fbTOiIO6biDIp4A8WMvpC9+Bs3Wupg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2frhs9ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:21:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9213e04641dso1680306d6.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170075; x=1795774875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n6xNjiXLI4ldZMgm9vuyivlFeIPVFifPb1EDl7UJecI=;
        b=NFgi5Vhsn4vUb/dJrGBKsAI3iD6JYIgFx6PlTkCMFzalQnnNOBBws3Tt49vqVsO5uJ
         nuIGID8R+E8jWn5uqdILU4PsoLD4aGeJwqza5txtBrIFLzJRR9M74vfx5TvqodL3Jecj
         iB9SSLFMi36yt9yfyIgUVD5jddTPnfXcUNAEnsAcj3m//rh0ghlGbGRFLgZyRwX3f3al
         SwRgGD69gl0PSsvDmH2Z+BzB991hQBtpYLPhkJg+grUSSdc2QpxOQgto1/exSveWfuKR
         uSyIHHCEUJpVrl4MnDCywRouZUdekQkzz8L36KrEa6eFiK1hTZQmQpu0Uak0YwG+BPnw
         p1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170075; x=1795774875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6xNjiXLI4ldZMgm9vuyivlFeIPVFifPb1EDl7UJecI=;
        b=Lc2jcGIFBqW3oGsSjHf0LPEncSZ0NT7jP0TFLmE38uaxZGyUdfoVvktiT1q4+4fDci
         FccRmwpJ+BPgmYHvYk//5P208eHwBrZnNKGSX8+pHLKyaG4WtieEvZG7aLZbZAQMf4VP
         IWZOJUYppNS1DpM4xB+RjhAG6HlAx7eZr1s6uTakOtPW3hNj7vAHR4Z9Ko2Dset8LmIO
         Re0RJ3CFc/AMJP/b88EfAdw4O9rodVcQ3UIJOR1eotlAMpv325JdMccaRI7yAZGjwGvS
         767aLWHDpetlP2d5YA6GdcrpVmLORE9Mh0huaYx7rZxVo/3rpX6MRjUeErXjrcdf9jE1
         Fspw==
X-Forwarded-Encrypted: i=1; AL+hErGRXHVV1DDf61MiXUw/JEtB256PzhiCqVwragpBLPE4u99IDCBBcwNzH/U+dSfqV6tM9lr8ZIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+ipC5U6f4RJPIpXtuRPnhs4EVrWQErYDuQ7O/Vq8RPKTCtWrx
	5iUCLn8COhAUp5gRHRs3SD7OQxCF+lUQu2KVzWab4FIlsNQw8KuE3BykC6lmXOXOMBbFFaBV3Bc
	i5wwEZevBB5GzDEO2uhCtknr6nJCpOSWXW3Oa95H2X7ScOOYkr3qX7+QzL8Q=
X-Gm-Gg: AYBFou0RXMqkr7kLv1rT36aL2qtnxTwrpLxg3wazPuTb6dbbbjVJNZnNEVZWrba1KJ0
	r7yGtc1pnKHr5G67JXuK0S7gejPVuJNfl4qOmSk7nJYNW8dyTETgjCAk91Y1aTtlepD5P418XD9
	69A7vSvuUryTbXQ5rWaWjDCWLhQFZZAs/1EkTRSIghyX9yvpnb1zcpBVLVVx7hUUI/JiPXGTyjY
	cL9DUQw6iQjha27Jj4XRlLctZ0d2X6NZ2721uN96GE6XjAKVWU7fssmIh4jouVsRGIMehFq6RWz
	zGvxiNSPiUKs1kIh73hrQ06okHrx8bX4072SSyvhyVL+awmHop1pHFejc+nViA8F8Z4EM5U2Th+
	/X+oeJzTz7AWaVd+VHezvWAcWwHPCfgkJaXamgiMaRrJozTAdwkyJtK2TMJQ0pfB8
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr406231185a.63.1795170074893;
        Fri, 20 Nov 2026 02:21:14 -0800 (PST)
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr406225985a.63.1795170074176;
        Fri, 20 Nov 2026 02:21:14 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f643adsm29150615e9.1.2026.11.20.02.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:21:13 -0800 (PST)
Date: Fri, 20 Nov 2026 12:21:11 +0200
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
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: ipq5210: Add NSS clock
 controller node
Message-ID: <m77xx44vjdg7e5myewy63j6nhdkgqnvvdyhqnohmylnbputjwm@2ymesyhjurov>
References: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
 <20261116-qcom_ipq5210_nsscc-v3-4-1eaf92698379@oss.qualcomm.com>
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
In-Reply-To: <20261116-qcom_ipq5210_nsscc-v3-4-1eaf92698379@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX2HPgJKBi6Zpy
 nhud3spe7iLit4DM3HogmtKWS5yMyXOwjlZup07DfpOnofxC3C98J4qOleEyNIKRbIMQSTqhAit
 PGVNdvvuSI40eZnzGKdaXB21cTPTW7A=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6b001f1b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=B4M9V4KaqHGFCjQwF8YA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: crlcBVgjM8LHsIBum2UhsUEeUFf939xI
X-Proofpoint-ORIG-GUID: crlcBVgjM8LHsIBum2UhsUEeUFf939xI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX7XMi3AuCFGy9
 8cfnREFJj0lXDTKTIS7+cte8+fSe4Ngl6d/tlbS02dEMFWMjcu6tXcFRj/+a4JloJeQ6JDOgSUb
 H5MmYZ90/2xsp4EQ/lOiLE9xp0+etwOqQsT0aG7OoBGKD+wzBg2aigah1O1IaObHe6rBlVrHfHs
 qhozp560kFF5bepIPupSnI5tuop0Na9Fg90uFAgBjg1sLSADi4fG7v2SAwDuwc0WcyKj5SPs2Wq
 A1yW/rPmWIXcKHq17ZZT1pW7pb4ypTuI7q6msLcrcJJRda/QG6UupwF+9TTHKRL9bPoCUGQEjbX
 NuuEnx2tUC2NX0G81hZElSA1fS0IN4ohjuG8yKN2D4cF2AijFYB2K9P19E5WrXgHF/pRPldQu4f
 FiikVBW+AFLe0NhKcWY+lT7Arnz9Gu+739XVLYCGfi4vHGRW3/oyQcMOKrxqYNwdW0c3NjhDTIe
 9jdUFrhzVjiTdwE3pZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 clxscore=1011 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On 26-11-16 02:19:51, Luo Jie wrote:
> NSS clock controller provides the clocks and resets to the networking
> hardware blocks on the IPQ5210, such as PPE (Packet Process Engine) and
> the integrated EPHY.
> 
> Note that the CMN PLL output clock names are reversed with respect to the
> hardware block they actually feed: IPQ5210_PPE_CLK is wired to the NSS
> hardware block, and IPQ5210_NSS_CLK is wired to the PPE hardware block.
> Documentation is added in the DTS file to call this out and avoid
> confusion.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
