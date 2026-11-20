Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169278;
	b=1VFmkDEkDGxLS45FE8THJrj+Qh8dmhI7mubo8TCaSZ+KGyFOqM+hUnb6Yb0AJDIOt4Fs
	 epO+jni1i4ztcRqBxQ3aJJDzbsl6AYKAgjrta4cRIOOepm1/vaEp+Wq5jgNGrOtCGgZ4v
	 LtGK3e0FPNnFjhtCjflqomcD10XRmJZRfS5qyUlD5rNeffLNXK4DaL8M7i8vSbLjMr0xc
	 t7M03VSuqjM+H5cA5ReiXdfNDgUcgfuw/x7TJDbFsOxlNx0pOyMJ6IfVCPtbKNWHw6MNa
	 n4ZqLhagAlyzOD2AViEqpiGvPvKwQPJZN4i8s+B7RQqJUOnhCJ5C3Tpzn/w55eABsWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mG/rT4UghNUXT3K+3KmB2T5hQ5j4h+o5zz/Q6dODnAc=;
	b=1d+pudAkdQzCUtzgvUZskFVGsHklCJXVQk4L/wDRGHjo8prh1okWIq1hSf58BtQSgBrY
	 k5lC1xRa46bgBV8KHKxFF3r5CzaV5VIfqphsHu4LttqxCUtwIrlw3AgAP3Zf/bFxGXaGz
	 IP7bPQJN5GAHuk2PFXXzXk/1eLfmjBHweKeGF9DOOnVUVu3pqeEcCU4Ho6cLI6XQnyHn9
	 kRrl6JZR6ujHtA90VzG7ACtWLaBLrLPrroegWYIYXeMQZjgeh/wISWvfbFzABvNtPY2Qa
	 MtMS0I/tuYDDVSTJTWmD0wQtgDbwuPAHy772Q/ZGCgFIdr3NUp/bEV0Q/nmw2a0l76A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqHRQxxi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gR/nZ5lW";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1045606A32C
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1045606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqHRQxxi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gR/nZ5lW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fRMO1049645
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mG/rT4UghNUXT3K+3KmB2T5h
	Q5j4h+o5zz/Q6dODnAc=; b=MqHRQxxiczegEAQZBfwxNU22C/SoRCgiQ0fJlCqv
	/czQxgk9Dt6LpUggnt5Eok/C0MnS3wuU01IFVPJSnQUJ8fLmi9gy1cQBnNGLF0PE
	1exYOLwsDYM1VmVyAHfEoF5b/dCiXq5ULZPb7FrzG2sWwsJk4EC7+wCvAZPvj6Ij
	tkJrZSBk+4X3/JDGM4LDTyzF/PsK4Z1Dc17+AXr/sCi+VnQaLD2Nja+qpUnVkNsx
	DbOZZiPjmFXpUaDdB5AddWMI8UI1zOxNwiOcZB/zxq7Ccl0pO9xvoRyBKPtHLiQ3
	c2cdxHU/B3rpF2ArVOJMXHBA7+xNE3DExLwrbJ5Ta6XYsg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guagxq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:07:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92106c98714so16189526d6.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169275; x=1795774075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mG/rT4UghNUXT3K+3KmB2T5hQ5j4h+o5zz/Q6dODnAc=;
        b=gR/nZ5lWSjrcMVuk7HciyFObAo/bq4uwaY0xR+5vFDlj88VX2vqb8CELmVMI+E6DbL
         M1yTLdwwCtisZ28m+jrobnLwAATeXa4g5nWL4a9ssDir5yhPmI/vEDU7VDlcBbH0CW9c
         2vXSpkqo8Vt3LZ11jSTOfIX5OB3TES8emh42t1B1ASUy4UU75tOQjlc1B9xAwrZnueJ6
         5EoKyFT1cmug5yW/TWFSu5v13z6mMz2hwahxAJSp08uxizNfXehGrgiaQv8hDqnG3CNt
         x3esoPtff44qxh79jt3AXMaeFfGTTL1ONZDWbCBsl3urtfer267CZ6qU+HbuNpPmR74X
         x0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169275; x=1795774075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mG/rT4UghNUXT3K+3KmB2T5hQ5j4h+o5zz/Q6dODnAc=;
        b=0uElIixVZl91YIOriI5pxqdaMlLHJGHlrSoFSZbwugmBLEDfkBfTkptT5pV4nuduk8
         6BjnwCAttYt53ycPYXbYCWJK0IUQyv6ge0p7KTDY5LY20EW1WX3sS8XBWlh+qw5p2ORB
         sHNXHYkDpqXj1VAowSzo+8qLpsQYJfJtNQ3vyv37evAen0OX6HGKjKQunCAy3bV+4y62
         lL2KQV6/fQX8y1J64/nmboxz0ow92pHhl63VNa32Y60y5mysMRtera3CFsNOUu9UHX6n
         dVKTibFTf71QRb5x3GBbIzKM7OYuQYibbpkhqV+NtOndODy3J1VViaDYFbMvVeW3Ri/c
         dcZg==
X-Forwarded-Encrypted: i=1; AL+hErGgF7hB0uCB+3rsAq+6BHI67EIh3NGJwmE7Izz+QKaQCqzq832eSdbfRzpcB6YvfjwyZdoULEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0BrG+rUIwdQWV/4PSZmO/3Ee5VFL8efHeLAeZb/i4NwOdqqhA
	afK556Ngzb0sKma4px51AhmgWm/1Tm9oYGFj12DNVfQ/u1yhqCy0JsvAHatmtWyJE1SmoxN7sKg
	TG0z9ZQ3KlqOMqr/2UIhwnHuvxHpLLFub6cHx2FsC/cL+K4W3nNsAX7bZFLE=
X-Gm-Gg: AYBFou2sCr1ZNDEA2CW+FZZbCLo/fJYKLpORQ+UB9M4mZfsyTSERRg+jEWgp8XmqUwG
	fCR1qTDP9go7N/CNwkV4+SGeSFbW7u08TW48fFfzDAVVLc/d0v6Eme76/IFw0KHM1hNwrR4XZrf
	kyRdzscVdccLW88Ak2SbcfCJNzcFl9TzBKrM7kT+252TF7RDX49nw9ZpDWpcxBK+wAS0Q0fe5B0
	zEWrYjTtCWmHGcLgQobufxt3tv9WXYxAoPzFclB/G7UBwhxy+r6/2DARLGGVgFsmb6FqE95XZNa
	nERHCmdIQusJZV+HeubX720k4e7NG+hbHLgnwYSO+qBGHzZ+PBCTMFibOeQNFN3kVGvPFPEz1s4
	0y+W9J+TvyUaq+4LM5jfors37zwJy18RU31KqSj2fMPywrQH1NsVV0wAdkmZz9mvN
X-Received: by 2002:a05:620a:f11:b0:93e:5016:e3a6 with SMTP id af79cd13be357-949ba9c6e0bmr449681685a.26.1795169274976;
        Fri, 20 Nov 2026 02:07:54 -0800 (PST)
X-Received: by 2002:a05:620a:f11:b0:93e:5016:e3a6 with SMTP id af79cd13be357-949ba9c6e0bmr449678985a.26.1795169274365;
        Fri, 20 Nov 2026 02:07:54 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm4306233f8f.25.2026.11.20.02.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:07:53 -0800 (PST)
Date: Fri, 20 Nov 2026 12:07:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock
 support
Message-ID: <6r52ghmfpdspeeh5ucxbcbcoir2fti4j2pyptdomgwouudpo7e@qsspx4h6hjmc>
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
 <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
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
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfXydXvQHuWR4tg
 IcQ47wxfDuxozhm9MB9CHJfzi7rFpnF8YEL1tQ1ydMg/jPRmS7Vwy9gU6lJv2OmsEq1kDL1HkcH
 /qeRdOI76U8Q9XfIpBcY2Q3GP6oOliOinxoGRWPM/HLelMp3lo4+0zY7eWOcF4XsqTCpQ1KYBIc
 V4/V7IWkW2KeKltNGlMsTdxHyBfvjVA6m2Fjj5R+fmSoKqi32xjNhzs/1bitwt2/HB/o5BVilWb
 T+DCATf5WetPcDxoT5iKOBh6qaePK52sHqg2l+Tk+Y9IqGJ05DLKOx9F5sEVlGsuRAKPTMpEOGK
 5RWcVwII4828VMO/B0oL4iSaKS6cAYSS+x1er4yMBisXJn0WxFW283ph8uBqehiXqJouOvxs+2+
 5YZNVC+ii1AW0jQ092eQ2GqfTg6qIpUyk1k7knduBonDw5i3KyrXLgarf/6qsy7LkSl8uFUyDWd
 7iVA16vg2tp7VZYA00Q==
X-Proofpoint-ORIG-GUID: yuo8takcW0bOxLubZtTRTseZEqNs7ylu
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b001bfd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-HzP2oy_C0ZWqF548KoA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: yuo8takcW0bOxLubZtTRTseZEqNs7ylu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfXwcSjtING/sMx
 +lW3eRo7ypm7lFdEY83sZna/k0Lt13Gx4bC9GmzjVWrIND+Qe3Wl6VHT7a7J8PS87/HfO+gaguX
 +W17XBQIuXgjcc4DoGiddiH6Fyv5da8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200040

On 26-11-19 22:34:21, Taniya Das wrote:
> Describe the I2C slave and TSC subsystem clocks, reset lines, and
> parent PLL needed by the Nord SE GCC. This permits consumers to enable
> and reset the hardware through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
