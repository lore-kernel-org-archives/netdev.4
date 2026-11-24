Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536168;
	b=Xv+qD/IPr1x66zxS38MtAhQ74DIMrq1ZSWzpPg24teVBACjVM7zV+cvXuIh7aXG9vM1/
	 q++D+WAn0+soWCTucdni2zJiX+ksc8uGnvyIBvMmGB2K9VGG31aH0LNXlzPq0AUshxMJd
	 1L6IgsEsUmVid6nPIFnO8LfyX9w9Y1DOsQSG5rzO+MdLRmTbLAFWdPdOiP9J6zqdVi5y+
	 jszb2qrXbwPmH0ZSuTkEmTbMk4hBjgm99Bi+GwZvzn98ePuK0zpDFl/2OjF/fxajlVLZv
	 IVaxAbY9HbfOiO+XR3OynkEXJFR6CsOSbs1iiPe0euv5hEw6Vmo71U+XdV2NxCcpCsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536168;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7e5IkpeNb6Jnq3ekR9vD1xEnTo2vym3AHpRb4B0Ibcc=;
	b=U+JFSTMGs3zb3+S6avhen5NHo40eH9Z7VnMo4R24V3G3gPJYA/+yPbfCGFN/PKYfJcnq
	 DrPXlMZ97xOCYkWHP5lUqMuY9+ZkNXp4kHgu4ezpmVMLZv6Y+m7791Diz++3c9GL+u6Ui
	 eHhoSo+bi7DXNAqfKHQqSgahdu7J52ZGCKW7zuQxtCkZjLSvcikZ4lZ8dAkhjOnIEeKkL
	 D6i/TNLjwxgm5vqdjwCRJ2/IGVzHr8WPllg5fHoLlawxlnkB2BSlOVw3GjniVkcZ8qlsp
	 lzCLQWR8a8BzIaBCjQ+mGRefuNE4fE1T8Spbzq+PclaBg58BUVqRJLE74VwIEc+CTSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lvK4NXkZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UbimFH+s;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6715606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6715606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lvK4NXkZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UbimFH+s
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL50R1696905
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7e5IkpeNb6Jnq3ekR9vD1xEn
	To2vym3AHpRb4B0Ibcc=; b=lvK4NXkZVCfaLQE3CerZ13b8vyja8k2emdEbwSCp
	vHLW4KegKzU+SUm3+j8urcgcUUuE52ETu6NFLJmQjjGSWXEgZp38p9T28Bws03+u
	5SSwEIWJzZuMp71ifrUe28tpmZR6mNHQttxtVY6+hcWVEnuOYFS9wji97Xs9T+Ra
	eeyAzwGirdlPf7dRh8e3GJ1wCudn0AtQiKW2ipvSl6BmEBZ7KYbiKkOaVg6Edj4T
	dCKon/cjBNx4fg4qUtLiz5ZcetPeAT0pwkF76torbJ37iyBgl8MWZeMc+yU8ZC3X
	uLEdmh1BVvA4mlMuVDNiE9xShP59pBVtTmB0UeNpBd7dTA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b800ts8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:02:46 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so2996446c88.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795536165; x=1796140965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7e5IkpeNb6Jnq3ekR9vD1xEnTo2vym3AHpRb4B0Ibcc=;
        b=UbimFH+snDESKV4g1/rdj2ph9dB4guSJdosKCagC1VHgKkx/0f1j6t10Am/KlX59ik
         vp3hl8bCCnzpeSldVHikw0i7TzBaW+0JYk+s0HCgzEDRqaIgDI2UvUPlzBCuinr3+iAL
         kX/OB0b7FjylV6lcqBBYU2f0lgqazkyeqJHchfYfOz/t8QMZ1mNM95GHUd1pZVDxpGXn
         ux1tAk6MkLGuZFrHx3cIZTatj8qbgH2SI6FnrkQ/dlw2w+b/T4/rme+h30UhZN8ZYuvq
         ViRarZdJ/fcUWMS6l671WB9ZzI2TBLisd05oq2aChIhR02rmcfD4rPGLx+pUFqGSDWg3
         BTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536165; x=1796140965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7e5IkpeNb6Jnq3ekR9vD1xEnTo2vym3AHpRb4B0Ibcc=;
        b=fv0+ZUaCEUWtxiQLqqcHKSFcmqtcA8RBVK3LoZIWmkkeI0XSycjmOeag4mbZkqsMfp
         t2IDhpGo27OFgqb4F9U4pezkEoJHsj15fpLAfE9btw3/DDKYhCvDwnRGQ2UZlUWGuSc/
         c9qokrNi2rhMsluU2DUNix5WC6OcldQ0eOTAsllME0mHJmTic62Kbqm1ZG/QcGT1T19d
         mSFxlnfrjfphQIkPBtYhxfss2WX6V8b+dlCM6cmveCNXdnu4yKw8kMRzqpmI9eEKUzH2
         eWsRNlLNYk3nkajJw5UtkdP6iVaTHXrpxCos5lvx0Jkp2xHcCU+5fuYpGf+K72MHMl9f
         kDew==
X-Forwarded-Encrypted: i=1; AL+hErG2+l7O7rKfzrcvajd5nBIFgaPD84V10SNJudexXFD4YgPFEBVr0PMCjJvSHapslryZ9O9EB5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ilSeDEOVgathjbYvvTYOjGm5PbhaxpaPx/ZJyze9LocPx/GDW
	jCf0WUcuRK5vlPwsPCRrkFVgwkU/2HBguI8MSbVEHix2fmIUun38CaKY5yDgGhOsxcKCMaGltVr
	v2WLFw+jozxVbYcCf4sfXtgOZm6cpg+mRRjhHGBrsAL6jifokeF3GoCYZDzo=
X-Gm-Gg: AZFdTZe9AJIasM3uy9IH7YKjwiUgXvNbH2kSnMcFMxtI8qkdW5cgc86Yby2uPYPZ+9m
	Y3Ft9KzZnTFMT5K0SkzGU1aF5gS5xjQlYqkmo2sHy2Q2YylDP4LFh7dVfMYLRscMFOC23fMaFDW
	EJ9PpHXoRss+kf1KvvUr4tukE8xmOtPQ2IQ6TaIS8xSh4MGreAgX5Cggr6+34CxWEo3nb+OrhmO
	288ZdYPfvxpEGAtzlT8p9nyeViNuWnxbZ6RkB6YEV1ey+7trRseK1RGPCEK4UVZsxYrFAMkb9AU
	XrCyPz/z8dokbfVolQs+m6gOxoj9blNTOqfpkGtthi0zuW7p5eNDWApEFWzb6BspYhbAwTfFiVP
	c7e2lDxLl8ObKAIgCn15fLIZ3mU6apNArAP9OoaLO6kA42NTZTNamLQaL/coSGA==
X-Received: by 2002:a05:7022:3f0d:b0:16c:3408:760b with SMTP id a92af1059eb24-1b5568dabf1mr15168431c88.32.1795536165195;
        Tue, 24 Nov 2026 08:02:45 -0800 (PST)
X-Received: by 2002:a05:7022:3f0d:b0:16c:3408:760b with SMTP id a92af1059eb24-1b5568dabf1mr15168384c88.32.1795536164374;
        Tue, 24 Nov 2026 08:02:44 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm51670984eec.24.2026.11.24.08.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:02:43 -0800 (PST)
Date: Tue, 24 Nov 2026 21:32:35 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board
Message-ID: <awW1G1Aou/65UZ89@oss.qualcomm.com>
References: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
 <20261123-lemans-draco-final-changes-bringup-v4-3-dbfc15cd0883@oss.qualcomm.com>
 <609ea06d-10c5-4727-a9db-8d42e526befb@lunn.ch>
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
In-Reply-To: <609ea06d-10c5-4727-a9db-8d42e526befb@lunn.ch>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MiBTYWx0ZWRfXw7cZol3Bf5Vi
 a7uQnmkwLoZzJUWU0Z4AcGmDZnNrN0ft6ARS8f7pggDJ1wImdLTLbzzc2d/GFguAML7aMs76z6Q
 mzELgFP7WaBToOKiFE0g4+wCDIgrAZaP8eATtRz9UrQ2eGhV3ae/RmgG5tGb544s8248neZj1ZF
 1OgjsSiIgT53g8IWk2FyyEUpiIM/UbDONbG5GXE6BTmZVp9hGKyI+LAjDhwg/vGe9pdSEXKDqjj
 3wmASPsyRJCTF+v4tye3Z6UF84dzs/dSPBJtuRhOUeBFuWeEOk1U9HQwGl+nNPYReMSlPs7Ud+r
 fW+PcXTqbqA3r9kP0pf6shHx/w0gGTx7dB83sAjHU4X1yX+K1LWeE5AtXyeQqpkCgOg6Ngg2hCF
 EUqqJFxgbBNK4i/lBUSrCtG0X1dUWc489I7Wv46tO37I2M3CYJ2IWM7IVjdT52gm04YG8MGacRi
 wG0rl07A/j0G7qo/f1w==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b05b526 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=kppLnbNoFjUBNF5CwvgA:9 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: p1HcyTPt7RTA5kYSJXpaL3FFBKaWWwvg
X-Proofpoint-GUID: p1HcyTPt7RTA5kYSJXpaL3FFBKaWWwvg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MiBTYWx0ZWRfX498JcVyDBuU9
 c1cUjc6XrUF+fwQYk/KriCg/BIpt52N4TUQI/P/8C6f/lx4O86xnxa9BThNQ+pZFgiQfVWEUEU9
 7yvwu4mqyy7jo/pqaaTXp6FhGa6kJL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240062

On Mon, Nov 23, 2026 at 09:29:49PM +0100, Andrew Lunn wrote:
> > +&ethernet0 {
> > +	phy-handle = <&hsgmii_phy0>;
> > +	phy-mode = "2500base-x";
> 
> > +		hsgmii_phy0: ethernet-phy@1c {
> 
> Same here. Broken 2500BaseX? Or properly functioning 2500baseX?
> 

Based on my previous experience with Lemans based boards, I think its
the former: overclocked SGMII / broken 2500base-x.

	Ayaan
