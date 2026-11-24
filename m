Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543435;
	b=AOluJpP8w0qsr7F3YfFklUQJWpWlaC8Y8d1T383gPJJe/NOOhytZGdKtdwsTMFKaUwVR
	 XNXUckb2LWoPYsTVYX/3DdmCdhpCbFGkyJ1rKoP/iu0tV9k6Ob9SJd8nCDsWJGJ+s8uB8
	 496WscVPRZcc66ds8YUHpgEYi1ZUeQtZymueUiMW7vq8fh9B/nvfEbAr0u0q7nOC7Fw+n
	 sqaeblRPXsCx6oIRYrBOwuqlJ2SKyAOk/KF9PYyAZM6PkPtYZLFRaMkAGNsPw1o50IiDJ
	 XcR7TmJOC5qbdIb2UqKaEP3orfNHozbhkaw7YxNJGniwhhqfyheOvTduaEV4MNzUesQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TF0c1n1qmDgcnQcm1xackrdRCsureoDJdb+lSA5CUB8=;
	b=4JA64KFnb7Ceb8V08O0coe8BmhE0jKy5ISI98J0+xTNrDbXvqi/qiKRaEeSGrFmLOow4
	 9yBwSF+SURcpNVQM5n6cHg+xfS62Cw1JQPrVWTZY4TwExGD/2nTul97RM6vCFFpEx6fp8
	 6TSMnvIWwoprhdhPOOpEdHhW9RKgAsShGbeMQbd3IFEy7bto1cNUdyAwbQHB8jX6P5cyW
	 /eZmthLW3hXa/FvT9/0ulMIOWdwAtDC5BFiK5QqRsfmDQ5+G8vnkwVWTGUoUVDzxGK7HZ
	 cGNcwljcop6vndsX/emFnq+2dqqSrZigchLuH4ft5ZCFWCmXW/Dil+8AnqEJxnP2MtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IbuzabuD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQWYmbiZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B90606A681
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B90606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IbuzabuD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQWYmbiZ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOHQWb42852878
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TF0c1n1qmDgcnQcm1xackrdRCsureoDJdb+lSA5CUB8=; b=IbuzabuDgb2kb6Bg
	QCtKn0wVWujh0ZSZGgtE2XOMW8TcY05NGK57bG009UWhIc0AxuRmZAONJxIYH4g5
	pYH4OgkmAA57QFg6Bzkv5DZQ8YVYKxqGmn0S01LhpDeEC+dY7Fp3ewcmND3aRAcv
	OkNljZt1ZkVbSqDYRAHV/BDSRX937mYjPImiWYqzY1r0gdYPGzTar2ueU1nAlCLZ
	bbWeejHzTqQr+NA2YvuxlqZYWSi840nmhy2u/NYJwpQqwM86bN4H33RNWTvzFIGD
	BWP5VxyLIsHNufXTGhOydZGd7+lrpThm7CHYMa4z/Xcjz8MhyUML2YbNraTqjcQQ
	cvjBCA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5f00g5eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:03:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869accaac2so2849126eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795543433; x=1796148233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TF0c1n1qmDgcnQcm1xackrdRCsureoDJdb+lSA5CUB8=;
        b=jQWYmbiZ1dqMkBZcb64cxcnQuPd/zyHMpTjEcLq0eQ7PgEyJkG7j+0fE2Y6tfksQjC
         VPJoH6mkQQBiG11oLjAuX0krLAThiJLTbUN8xaWMzhNlUJtNHWS+vJBfIuQsAb78OBEl
         SGEqxxLKGfJJsn3H1yrC+fFYECdN3qQ/exGRJAtMMR59taWqi486vGkjBBI8vzH0g9jF
         LFPkFRIGDkzUqV7nR3YYnBHyNnD1KUZXUdj+oM6+62VYzlSApKXO9sSdA2+UI6LNaJfI
         fDgSRtLUOo8iE7Qu0WVS9catSg+8tFvjrdfXj8Axsjon42HJhR3F7ICkl0wHgnQe4eLb
         P54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543433; x=1796148233;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TF0c1n1qmDgcnQcm1xackrdRCsureoDJdb+lSA5CUB8=;
        b=y+AmOjFs2zMkSPl9PXmBdkoFdHZCwcgnYXqtgnPNlSr+tapj5lCRzobL9ui4MyJro2
         UhekAQE/7FM9OETNRlK0gubOSOPgq1l09kskQ1W9KFcG7K77Tl3nCBTFdK2GMiDLEEhd
         2/Fndk1eku3cja4M5Sgx8wI5bFRwTYcH2xF9VplmWiVmi6zsxr+m08dUVycJpOIQfopP
         Qo7ZhKH34SUwXGCnuBVlBzwa0OSP2DfbwkUcPeuHfJNEtDiGURsDKZKetIxN9WkLz9RO
         BF02Vv/hwqHWOVek/fnxcmQza6zLLdv6paWMMgpWOE+e5f73Fy21w1EdKffYRXwFb6AO
         Eofg==
X-Forwarded-Encrypted: i=1; AL+hErHxYVfr/633j0xljkNTYrY7cidgp3QPPSZaPopG4zndiN7wmQjIT0r1dpCDdYT3p9YMpFHJm+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+z+H6YtAbC0xamCHFrsXECSndVNpOAJJGQoSqyAyzXdhzhhjru
	AMcXVyLyBPuuA5/HfY8Fzvf3fw9R3Bmr/GRGOQgOaKh1VtzT9rg8ptT84QZKduO54Rqzi2lGqsD
	8yO5XUMbUUVDsKnw75hCEEhOP+xPGgzNjuJTQnajg1fOyGCgag8/aWi210Ho=
X-Gm-Gg: AZFdTZcLUhRINkj+a2m9mKxagD/DeFlWqVMHTFj76vVTKw1hHdDFGLUZbKqaxEvMTGX
	VY7TEid72mvtL5RKx+cnAx2Y4yWlpvOSxkuPFg3FCQOMpE8BipCewcGm/q4D5KcVvWy5LC/zJ+6
	8zZSajX8nXpQr0sulXXw6ofO59yjeqhLt9AdbxwHgcxO9IgfVqi5CkbV17pdEO6YiirMCAFmT3x
	YDmsQJiodV+yIaCKf79WBpX2K9Wsn3iO9s2czo2Jw7Qal97wN5hEN6Y/SKT6ko3HjSo/yllOfpO
	TfKrmsHzzgIt3uSKmHXSdR9/g+kCa7l7/NIrViAWIUaLLvmuiTsN+zJQxhrDLdjoIjT55vSo4Hy
	Tp/TefutMvoHP2+aFyECE2xjxZ9xneCkO52zx1ow6XV0PWpZnh6v83EfrX1rMGNiJiMvP9lTKw8
	yAdVpFBBcOhF/fbEK8HqWXJ2d+mkg+KHc=
X-Received: by 2002:a05:7301:8616:b0:385:9424:5c08 with SMTP id 5a478bee46e88-38594245c66mr17360559eec.4.1795543433275;
        Tue, 24 Nov 2026 10:03:53 -0800 (PST)
X-Received: by 2002:a05:7301:8616:b0:385:9424:5c08 with SMTP id 5a478bee46e88-38594245c66mr17360522eec.4.1795543432590;
        Tue, 24 Nov 2026 10:03:52 -0800 (PST)
Received: from [10.226.48.50] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm13598889eec.9.2026.11.24.10.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:03:52 -0800 (PST)
Message-ID: <487aa76c-9eeb-4342-9877-8c5d0a342ddf@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 11:03:50 -0700
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
Subject: Re: [PATCH v4 4/4] accel/qaic: Add callbacks for DRM RAS netlink
 telemetry
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
        riana.tauro@intel.com, aravind.iddamsetty@linux.intel.com,
        raag.jadav@intel.com, simona.vetter@ffwll.ch, airlied@gmail.com,
        kuba@kernel.org, ogabbay@kernel.org, lizhi.hou@amd.com,
        karol.wachowski@linux.intel.com, jeff.hugo@oss.qualcomm.com,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        youssef.abdulrahman@oss.qualcomm.com
References: <20261117233442.407877-1-zachary.mckevitt@oss.qualcomm.com>
 <20261117233442.407877-5-zachary.mckevitt@oss.qualcomm.com>
 <awWrm4Q543mvU318@intel.com>
Content-Language: en-US
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
In-Reply-To: <awWrm4Q543mvU318@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dpjipQcX4LmCt4i1yiYBm8MYwmpm0mlY
X-Proofpoint-GUID: dpjipQcX4LmCt4i1yiYBm8MYwmpm0mlY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3MCBTYWx0ZWRfXyMFqSQEQnUjU
 /VCWUleChjNF+l5so0YYr9ts1gwYxRP4qqlQd1up9ZZ+d4T31LMCKcqpjkZ6MoqC+VBB1fLwqkK
 glWwNNxk8Yq7taqh7yT9s4A/4CW+U1Y=
X-Authority-Analysis: v=2.4 cv=JqtkP84C c=1 sm=1 tr=0 ts=6b05d18a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BKpwa6Id5kTLf_hP8D8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3MCBTYWx0ZWRfX1F0aDhWfrV12
 hkJkJwjmRFIKkwwlEgmX29ROwZGujvbQFo/Y27+ZpxCnztLBH0fChwjF/VXtVlZJpId1R3vPI6z
 2aEWQ904u8BezRnb9OVJOJtUR6Ve+DkcVfF5rO/AgtugEPbeG1fs9X2ycRwaB6P9CR2O/CKcedu
 sfvSoNjkzzNbv0UjskNEoJOl8VVXX0N9CSyhuhM4rH+yaf/04LuUSrVsMf3ivF9vgFC1VXz4ZIe
 AVKBQo76498XsW/A+pvMsUTr5/TFElmPfuzx1ZOHWVJE9V+AYHXwLmdAp7wmDObtzW3qKnYRjbz
 qjRPRLb0uPfZw4JnRr2vNtMaJtelV3MqFAqmtwLijKtsvXM1uPvzxm8yqCo2MRXKI0Njn9bJWQ+
 FpChlYFd5CswZbFxDJNcTmmwNdfriIqtmedCYxJatGwji9XZZnd4BcItUH7LzMYxOab61F3kDjD
 dfESCdVqWiYj+pRGmpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240070

On 11/24/2026 8:22 AM, Rodrigo Vivi wrote:
> On Tue, Nov 17, 2026 at 03:34:34PM -0800, Zack McKevitt wrote:
>> Use the DRM RAS netlink infrastructure to perform device telemetry.
>> During MHI probe, create a DRM RAS node with DRM_RAS_NODE_TYPE_TELEMETRY
>> type and add callbacks to telemetry_request for read and write operations.
>>
>> Co-developed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
> 
> Can I take this and the rest through drm-misc-next?
> 
> I have another series that will conflict...
> 

Sent out a v5 with minor fixes, including moving mode from u8 -> uint. 
Should be good to go on our end.
