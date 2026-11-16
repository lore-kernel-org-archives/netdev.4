Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841170;
	b=VM6VZvXJRGX/nsYi5e2NujKD51IFzhlmr9gEACQS7FEYMTHZTa+Dh8MW1K0d7i7IBTZE
	 EAIcXxUM1TzcMqtviBWo5nrO6FO23zjIMQPCs5uV8jTlWheXktFbMUHmCfhzy59nkBjQm
	 2xdNV22k80dhvRFf4OnPiePR+RwiDcdvXGVCUzqWyl8sYOW3KedLmKezB626YFRJITScf
	 u5fvzzkarnx2WNnpi2hYGfix/0qGfuaUcLHtlN6cNdfjGOvp5ASwKi1SpGBXk3owfBjRq
	 9+APSXnZ64P0eVKHVejeqMG4PrhzznS5MUj04aMMBC2tafo8r+vpT5+glPs4Wfb+pZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841170;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=;
	b=474tM8j5VKHSvNpdZyd5H1nCRnGEeW6SMHzj2ovff/xjQtIuxYtLvBO893Y+p/guzvkp
	 K0djy3o9IJOc4zQplmkLs6AeGFu5NeUQnTJUkzUqFUzLQiJcYyNk3W+TQ5iS3ZXoNf5B/
	 s8/dcQA3e+4Vz2C6ZtUSnbB7hKnVbYKejvtCgqEOAKQdsJjzBTKkbkdSN5zdlXjZhcTX4
	 knGIaP0hahQGODoFQWZIOAmXZgx3+fxYsxB6S7gamZ4SmANZkifQCFW3wN0njLOZMEuYV
	 JN0mMK8mhmEcu4N0lWuFpYj6jXSNejG7MYFLE0OkUhmiykcETV1zc/oWYdtJ66lQNHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pb3Il5lD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XuN8VZj/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960DB606A8A2
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 960DB606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pb3Il5lD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuN8VZj/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrSF4782279
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=; b=pb3Il5lDZV8XGrNM
	LLuSfhhHKQPYEpZyE2g8CuQhGwpdpOranpBfGH1z+8fL+ZQZ/4zejxMicR6cySfq
	+r6sHKXKnN7agns5niIC4xjpjONWkOfAsMiYqKMfliPwOXoRbbAV7w9At3uB/Vus
	427D+gGFDDbcofjwFNB6ce3Vd1GCzumfUG1OFkKTAflqDiel3dRJksLkMR0TVO6l
	LbElOOEr1FtIjMupAas510Jt5Plv53gAlcnLzXFyGIje1TwUxvTR8GWmH0oipLxU
	GEEiD/+VxcFy1r6aeWzPz51l6VRk42qg8b0iX9UTS/VRYY3/9FihFrDxaAowT2X7
	PudfSA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgh1wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:59:28 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99e14fa4868so195988241.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794841168; x=1795445968; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=;
        b=XuN8VZj/tZIZ2Nx/SXm4kwnVKxoJ1G7KRhgsU+aUzVXa8+OHqowI+ha0wnrEyvA4ug
         XcjiuM5S/tVoI0wfhtDpZd5PIhjiBxUTjdlI4A9U7E5vqcXGFr41XFRD2diH3SOwGdgO
         4pmpUsIcuMEbkvwS4KECrKs2doPrQ9P7/Ih1DnnOclG/Lb6chzI21ar7aw1S0Pajr3WU
         Z5Te5et87AB3f+0v3+h6Wto05rR3vIVK0Z1UeSCZDgayA7nDSQUoiVU99RUyLJUASuAp
         qmBtDHuGCtsC0soFtB0kB8NSW3hV28o6Cbp58uQQy+bTG112fTTx1webFWg8vjZ2vUST
         JfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841168; x=1795445968;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=;
        b=v/crghSKIyZefKk22M/jcjpLXyaRWPD6H9EYmyYX0vw1fhnrne1iDZS+IOzC7fhhjk
         JRRHnl79Mlh/nPN95vw6b9teeC3BjWDrzGe29s6eHto8DsbAhE+py54Cm3UrocIMgsU0
         5hjw4JJntow339P18P7bjDlZWjsu/lYd8C44PjdRQmgg4LfXKzvHwNZBzghoVtjeh1rv
         Z2Y3OUlEskWqRgylDSc6Fn8i/9Dkik2KU1TJJGR0cIsSDsCBGvg1/pdEKkiGhBrPshCK
         A4b4kU6pvq2VwvnqbbWNVgu7e9whDVKTeaUPRy4ys/You8TojXiqeT2lLOynSBuI1GFA
         atnA==
X-Forwarded-Encrypted: i=1; AL+hErHuBa1tdUDVKAd7VQHGxeh43zFAdaOoRBIMpEul+1Q5TWZyGKR26/B2fTZsvHjz190q2YHH6FM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XVTLRZ6RtXIpKByGJPv/V/rWHK91Jxg1gp8cNWNVdX1Aba2WF
	9kBAUk0yefmXbKSr4DsvUj9iKbvXSOnYXp10XiyxmsmqMldamDV4Ay1MTfb8PN/vdEhfWoyXxVd
	ZWb7JAVRXnycTdOkDMsvbTjkRZqVgi0XotQWL5+XLOCfRuP1d36ph/GVH+BE=
X-Gm-Gg: AYBFou2fGEZMGZont5YU++3Et02uavGouzbCi0TzRENq3iqrc/Y5Gi0s3oSoR9WGjdh
	1/A/4+tqHZ4y+itCfPepkD2tGID7MRlRsjBHXRJ/XFU6NpfmSWRxx8Iwk+OJVlzJZdmSDtLY6PB
	KPKOnRZLxuduFbgEABc1/vTca2hjMKO1OP7w/lUuqbsAxNlYFGkaub4PC61W/t0Q8U08XHAx6wz
	/kuNDqOZjU67NK+S8YuTKM0oz48YVeC6m8ViWqV7COUV9NiCAG9c2UQYQQ7dNdgr93XJLq9PrLK
	710MSOfWz03Rd9SWJnHGJDUnyFrVu9/DMW4iSc2EBWfdOi971erMdJIgEQyWq36lknspsQ9tk9E
	/0qDSgYyU8SSBFZGgxjaFY/eR6A4wdeFPrTnsrnpM0UXR27I4Gdx/Po7yv95wMBpq0AwwaA0fge
	Lam7M9gC06GY7MjA==
X-Received: by 2002:a05:6102:84d3:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d64db55f53mr1834607137.37.1794841167896;
        Mon, 16 Nov 2026 06:59:27 -0800 (PST)
X-Received: by 2002:a05:6102:84d3:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d64db55f53mr1834597137.37.1794841167423;
        Mon, 16 Nov 2026 06:59:27 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm203948115e9.3.2026.11.16.06.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:59:26 -0800 (PST)
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
Subject: Re: [PATCH net-next v6 2/4] net: qrtr: Assign unique node id for
 MHI endpoints
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261114-qrtr-multi-ep-v6-2-2eb9885659e2@oss.qualcomm.com>
References: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
 <20261114-qrtr-multi-ep-v6-2-2eb9885659e2@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:59:18 +0100
Message-Id: <179484115882.1191469.10273528779891181170.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794841164; l=1115;
 i=youssef.abdulrahman@oss.qualcomm.com; s=20261110;
 h=from:subject:message-id; bh=nmf5XJiuMoM64HRXGwco/c9sJpA0SyP6SEfhcFZLFYg=;
 b=9OoXP1d0ITEfI+QdrBZsHqRZY/6c+avW7cSbPIi5eC3sSr8f+QRUh5U44OWYLgl3pZpz1Hx0h
 R+wI4GlIC8pCAYQa37AkKg9OACfKCpEBiEpQp1ES8HeLcaWicxZn8P8
X-Developer-Key: i=youssef.abdulrahman@oss.qualcomm.com; a=ed25519;
 pk=JsDnG9UOJiLmu4WZj456fEwZASBHFVClDZ4KZkiVFAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX4Z9OZLLBWiQW
 Sw5aqOZQyb0RE59c/hr3H/5Yyjyb732P8TUhcMJOs9TFQs7034Dt+gbCfQNs7Yme87LTZf+g58S
 yZu4uxPYVxVBycEUxrDFsrMInWRwj/M=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afb1a50 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XPvbEF_LEuHnWTr2ZGEA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: yysg7VnAgdjAC_yZFf9MZNPLdb5aWtnQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfXw8/pgnGwCT0N
 5lO9DNk3n9dtJjrnMl9Ps/wbsqk4w4yI5fQWxCq/CODD7xMaeM48bnPSuIoFF/TuaFd2Zib0vBs
 7a2+V9VudpANIfuCdBiky0rwDrrROiyIwFG5KhbqKal1OACXr/AFLBDJgmU+n+90rEzQKyVOCpb
 qIj0EVEeJAkIkXSkaYD1lbiFwYqO61liBWxbsLJ1C6Z1C8tdos2LG/G3Kvg4tbQ8GCYJ8qskdfq
 S4UA+g7bsa7ZL3GyjKBr/MFCOl7E3O+TlJBduX4IEw8HbVzYJsv+FocJaP/xv8bNyEnRG/yraB7
 nZlmXBQUBaW8zSOsxjFzqcZWVaqslLYEcObyFpGV3wiSMetT5lMwLuGzmLRtFnRXhJUpArqYf8P
 uu8D7VByNnxQlBGMPYEHa4aomq7YG4mJ4279g7cnbOCeWME6pdScAl8e9NP8kOURdwrkGxPgMbS
 3pCRmEz78t2+2I2Px3g==
X-Proofpoint-GUID: yysg7VnAgdjAC_yZFf9MZNPLdb5aWtnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160059

On Sat, 14 Nov 2026 06:26:14 -0800, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com> wrote:
> Now that the QRTR driver allows using the unique node id for each device,
> which is different from the node id received from the remote node, compute
> a unique node id using a new API, qrtr_host_node_id().
> 
> This API takes the 'index' parameter and adds it to QRTR_NODE_HOST_BASE.
> The index comes from an allocator, so the host assigned ids are unique
> among themselves. The base is chosen just above the 16-bit range a v2
> header can express, so an endpoint using v2 can never claim an id in the
> host range. An endpoint using v1 can claim any 32-bit id, so a collision
> is possible, but unlikely as the firmware assigned node ids are either
> smaller than this base or in the range of 0x08e5ff85. Such a collision is
> caught when the id is added to the node lookup table.
> 
> [...]

Reviewed-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Tested-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

-- 
Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
