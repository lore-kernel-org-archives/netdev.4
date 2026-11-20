Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165958;
	b=R1eqCTghlRgegl0PHBoezJKv3NXx6TnxGLgc0J6RMs6kEycGLyy0bTTjxdvHtMA566S4
	 ZJILa+VP/FPss2E0wGAYfUnFB3uOSJ+7c4VjvVvULZc7qsgVbzrKOrY2B2a2zC5TVnY8C
	 rgSxl+l9FEzQrFiytUW0Pci9d430N+FH2lnkIWFO5I0zVqEGl6OdM8a5fq7OvQbjcAz1i
	 aBuBDziXgspk7WLF7a+NkksftmL1lo3M6cSPUMrayJkoscaHXFm4+xmh11yX3lKHKB9Ph
	 HBVO1j3mb6NMqFj4rHui7h5RF8JPPHCdbqudr5v7/pEJhZuIybIynlTbx/teiM8lcEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=;
	b=16vWPITJrDTkg1tEeipvPHOsCbf/5XaWH/1VBYRwF1sWKx1EUWfS5TkgGV1Lr5l5z0DI
	 DAEguwXa9ppulTtSK3B5H0pLG47BtfW0P5tqkQRLIbntqzOXjIgW2Mm1fXDHfeEvF2pQ0
	 uHoxHmW4uGw0M37Qt+dr0qSQT115ORtcUO3pl9GOjq/ftHTT4DJXiHQ5tXZ1VWTjFeiAL
	 rZ0asFG3q8Q6SdUORqyaJjAzez6i75sBO3GqLNWsEnE8bdu0V33tVBALLsOOicQkLBR61
	 SQskLD9gy0nXrlq1QO9cpS6zJilcWmln5sU2NdUwDa3sUqvRoqNVmUIlmtIm1F7Q++w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gVmAKGJ+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eW3Qo8ui;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3121D606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3121D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gVmAKGJ+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eW3Qo8ui
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7etKt1048848
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=; b=gVmAKGJ+bahJTHDM
	2Q5EMVxlNljNWHr5+3+5k0Kj/AS+2b+xDCkX7V3JNA26pZfiwl5qg+zSYgbuzCra
	T5F+/FhO2o1HuwI8Q3VQh7Ygj6v9U9rg+x5DYySeRj2ocL+oA/ddxmYQfAeDPrI0
	fI6zq2cvljcn1ONBrR1dCE8bhD4Et8tjGNVpLcfJkEkodMvxaju+ct3EXu5FkY6U
	ZtRsgNtZE352+kkE8H534/8c8XW3HgBC2CA6YdqWHCtZ3vTKzLPBKRbBaQ0DyCg4
	nQcZXCbuZqSFHMMq5IdXJI08/e4decKvfpkDYEBhfC3E4Y4SVBSfyjtgqQN6aiMk
	Y4QjDg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guagq5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:12:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3a9826f6dso792383a91.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795165957; x=1795770757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=;
        b=eW3Qo8uiqxjMDKgH/wEW7yBPXsyMvciW2yMkJJ2z3R8UVdyrNa3aIZZs9vop/LfnSL
         9GKwYGY5TjrVDuer5mP3X+CefYs5IFtfVPM78GxBLAbFjBhIKoXrtj9NbnI3nGLxsiV1
         F2H4Ihy8rDlId0G0LmQ4itX8sOEIjSFw2QVXEHQk2rjgzW9iRQiqInMx/4hWsYtQlX1x
         yxQKzwlypTvCtiZTC8BsalFv7YO1+rzJ8YNvF7Np2dPvJnNzNIwSdtyhW/dP90Hc8DsM
         4EZYg5JOKGm9UM1GU3WqugNBhnQD0Q2Aoq7ENWlwhNqhYvIw+jp6ueOqnbqw+lJjoRv8
         /+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165957; x=1795770757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=;
        b=Ilr1VB4mksDU87Jj61FoefKAkfukVq9Nl+WHxSkdtWWtHSp5aPVNeTckdLR5vbIqm6
         REc4crdgzELtXG4eLSBEGJl1GOl3JFPmXtPxvqQS+qXIvC7npWOMgF+4ZIBCx0lckOnl
         aPx9MWP1V8C9OoKPmH8KuS/WPvy6oJQdAhsvulUn8nNOZRewjgFuf57qY4CzNuPTbnkn
         MiwrHMvYTd3HJbA5r/QwX+1VZIugb5qzUST00UUdQvAV9/6J0uLQVu0tXj8VtKaVhA/q
         CWZt0UBwp4kH/WvBfWejmVWIF6SoMyYgdwSWFJMKafEA2ZaF4N3NX9D4HsohJhhvqcry
         LK7Q==
X-Forwarded-Encrypted: i=1; AL+hErH+b7PA14vLxZ9P5dExZH1KQ/qRPTffKfDexj85BgChtHkkqYNTZhVOCRyARs3cBHNQ0tJ0KFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YTzj98I+siULgC/D795hMLu9qaSZZRfOP68mS/+aCouz4wtQe
	wCK4pet4TSiSWwNEE7q9eg+oJIZvizUhejE70wNvGsnpWKgvyZMTTkc32OwYy3dcJyqm3lN6x3b
	MLQSJfE197X8az4ExnRawht1z9YDYh7wOJ24ACVEu5XaIb7Aae4LW68+RKto=
X-Gm-Gg: AZFdTZd2C8cVzR+OwIVp6nqpj2Gp5syzBues321e9R7UXJoPSiacEeSCSYmm2cqGbex
	LxcV1CoPs8IUEOP9nO/GPVdEPaG0XWG3OAbyXu2gS6VeWjrLPMtySbflB+r973TDZ3oYdMQ5SZk
	sJ8n7Q5RRpI8mAVYqDD7AakhCcz98YT/IWYlfgWdcVvqXcEr5YhN34Ra5xOychJ1M2sAv+1galL
	9Vtb/T9QjtiLcyxVFHRzJXf/EtDdv294YZLkIZsEyEKP6e7W/S2de4f927x6DZ2wqu1Zo4mat8Z
	lo9qgaXMPNe4/VzOQklNxZvqSgBr3Z4bx5CO5zoaoGnhH/LwaKS8Bn428y+QAsnICFAHv2mgWF8
	1B/qznzSDrK85bAe67DKZguSywmDz8hzm1mK4iLTAr6SoH9xwYc6aXHqRsZjMIeuHe4hxtk4w1D
	BG/oc66g==
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr1980983a91.7.1795165956831;
        Fri, 20 Nov 2026 01:12:36 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr1980952a91.7.1795165956350;
        Fri, 20 Nov 2026 01:12:36 -0800 (PST)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm3483495a91.13.2026.11.20.01.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 01:12:36 -0800 (PST)
Message-ID: <8d7db2dd-6338-43d2-8eca-fd6db3e7c512@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:42:29 +0530
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock
 support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
 <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfXzp/skWVP2/4M
 TTW72KWAx6LRR6tLsi5TnQrunqLafhOWfETunW7JxZQ2VGsa9qW/ntf0V5BjejNfiYRJIPsAoeY
 e5rIXo2LXWUoIpY4TbnePzxPkDbPzOVe19Qj9pNaXu2kd2hIYODznh92iqQRu0yrwlS6YTlxc8f
 L8HOkFcoFz8JH/Z+Xr53EC35niyA4u4jgaggiJ513ErX9IYWpI/PBpDjWosXG+0b+ndEAOBwjAl
 xw/3pg3IbE7p+a8uoUhno391PnwjIZPy55yMMfsBs2QxrSZTv1XDG7LhWRvLj/6mxY6z2Zl23oe
 KImutdal5UL77vLyjLlxKZHqNUQRRmk3aW1Q872F07m6e1mN5b6gdGIgPtzLerNWgbcEcCb0ogE
 5t1yFc5U0SUqRyeQ9cqZ6mvpVNoIlKrilh+mo1wsUuZ8+PtdQmH6PaaE43RuxQjbwJhZvKtf65B
 wTGbxKvFQtLQyrYqjNw==
X-Proofpoint-ORIG-GUID: CuSTdxmKUOB8pDIrwlPpFIj186v_2use
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b000f05 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-HzP2oy_C0ZWqF548KoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: CuSTdxmKUOB8pDIrwlPpFIj186v_2use
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfX2NS1ADq+zcid
 BQ6O3/pAKb4enF4kxglPu1mrtNWFOurp1IjkCSgu5+eLOFERUfavwyMhL+4vC3xTQRsaDyfuhMl
 GKusMf1mGiU9vqPofxSf/2PAVGMl9lk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200036



On 11/19/2026 10:34 PM, Taniya Das wrote:
> Describe the I2C slave and TSC subsystem clocks, reset lines, and
> parent PLL needed by the Nord SE GCC. This permits consumers to enable
> and reset the hardware through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/segcc-nord.c | 135 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 135 insertions(+)


Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh
