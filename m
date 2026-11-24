Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537111;
	b=vtjMokMNPV49OmmzywWGJfvGRVohjNLkbf9n5wDYEMsG7NYXY5hY/n8mXUFAz+uDQn67
	 lchU0cchw2X5BE5mpjEbsUpJnW1WQETLUd13Ycc5Y9Cm/eQ1oJSoXxT5+JZQPgP9odA6a
	 I6pcNzvdrYokyp/HAZPtUhz64nLTX3bkPvxLyGhEu4AKIGYYmEvQ+csly1cHNfzxqQNDl
	 krCpkWJxmQbT9jvNUPIpzH3FoVcOUsKRy4UUeWiattZrbPDVYaLIKUA15oK62vf3lPZF4
	 IOU8Tm8z/iB1iuyuD6pqvdqi6ElpE19VdJ0R6RBXcwWFQaTeCGJ4Y7Us/U0iYP5mMGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JUK9FZVx27oVQ4pSxePLEF2P+Uj5XRthoi0CCsG5QJI=;
	b=nb59QJzqZITIer6ka40J1XemaVX5f2gsRroLcElX8tksjheMNtZXxUJYK9erbDTMcaPO
	 6OzaxuiWjpl1TgARKe3hhwyyYqtGnWykmIRJIh6dcxmhI9LzqwIs0GsBMgEZQq8C6skQK
	 nHF4kMh5VFmk2LgcYw1vz6qTb7Yt6FlFHTPWaPUiPvBmG/RkdQuFhFAksKNGR8OAAy0q2
	 LjpvvE1nfx3K5sezE8baNNDQ1uuCBFugdaVbEJBWqMPplkwlXL7lZ1Pe2W0reulBxEFv/
	 jG96rdCCTl+Hr4Q99vhOjRbWbItKEkBOjRm8X8tv9qc1NetPsAmYXv0rZJbEJvhSFFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbrZB357;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kbzQiBDR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E7E606A337
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19E7E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbrZB357;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kbzQiBDR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFKwLc4123934
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JUK9FZVx27oVQ4pSxePLEF2P+Uj5XRthoi0CCsG5QJI=; b=XbrZB3571ffCrjYA
	oBODposDgEQh1UbZIYNOuQ6gn6aYuM+kVHuez+ZRb/APdUofHWWz1K0Fjeti6tMz
	v1jK8U+bc2EXaGmmyuegTt/ZwqFZMBA/FXlqJBzfdd3yQxKD+O0kcjWnxSS6GsRW
	6qkcXXOBW/fT173dfVTC0PvZvOB91t52WSXqW6RCZcq8vXH8GzoHmCAnWJ8CLPmr
	/pyN3O4F2zySyAhHxrae71gd6DqJ/53v5K8UBe8wALKGbw6nexPPVbcWoUXQhyYg
	0TbEHzbEKLZDA7zYpju78pESmreAvHJ46yQE0rpAvhi0fO6UiEPR6XeTeKinhXva
	yMI0gQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rhapjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:18:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso6565312eec.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795537110; x=1796141910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUK9FZVx27oVQ4pSxePLEF2P+Uj5XRthoi0CCsG5QJI=;
        b=kbzQiBDRm4Z7ami9X7K+ME5DkQNdg9RVCxaYRbgBrirlhxzPfNSRmLr2foxwsobxUc
         MvQacJHfHs2yXe4tnglZ8Ndkg7EzDxnB1YMEAzllddgRMXQ6RZ8LRxZK+OHuVPgHgoqQ
         kfP2WPXdfVAYDgmxIqYT6guTovgjcuHGiZhTpvtLYf9QahyBeS7XvS/mZbuLBOSB//XS
         xO5GRghJGHDWd8VJNJGjMOmVm+3BE7MPkQulqaUYYj8saftKIepMKu/jRBrs7v3rZn28
         rJKUweoD1KDXLM1Y9KXa2xPjnWUkI+BgLB5NDEzlINr0F7Rz6gqEAwvQilZbFWaFHXd0
         1W+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537110; x=1796141910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUK9FZVx27oVQ4pSxePLEF2P+Uj5XRthoi0CCsG5QJI=;
        b=yohLW+rw0S06XSTcAMh7bJiYHwf7xS27a0Kf8potKdG3+eP/Tka9bcd0g4frMHcs+y
         /ZDhE5TeXektDbkDiYIp/A48XQIhGEFvmoDUdDhbs+GvbxTK+H1XOCcw1e4sGtT1oGv0
         q3JUaRen1bqpaiRjNcWt6a+INBibgnHg8W719l/mdGZvWvg2YBtpQBqpvesLiPfUiaMx
         AYuCphhQHzUzDI1NMGAZxedY9/XpU2gFvkY3FAcexzTkShHLpIbhJXR3GgF793OjdOMM
         YStiRDo4zCKi41eq/fM92imIgQd3cIDoAbU+qpD5bASluA2kn6x5LC8urLBHIilYqnBs
         p3Xw==
X-Forwarded-Encrypted: i=1; AL+hErGX1aoHn80yNqBcpY5szXrV6aOdUe9tPld1TwBieHFsg4f2/M1AAGm/NHXtSXdGuDtzYgaxPco=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mlARzvk2TtipW/HoQUKebISE8X1BqjU4O1iRB36PoiK34qYnd
	QkT/8H0wBzJNXq7XsBgqChGQbUhXEPbKX15ssPPTEuHkVpZwR6lDkReX+2CRK/Bv4v36v4R09gt
	I/wqD+tyDyrtt4UGNSZIQtSAOIir8GgKxsgQe8LW/wxhDMmlT9LCYjNQVruQ=
X-Gm-Gg: AZFdTZfSp/BWZHgwM2C2ruLjHP+TKAdiHZMnFeO+Iz360ChmdkQAXvX4nX590BRsZ8k
	3vc5rQvv22ZzO3XEeIVReCHh0e80eUiFUDXFnr6Ag9Y4u51CHdx92jGaYT6xPkOYxtixNedtAUO
	MMADysV3dPMVUjTl6WffTSkb7uoT/WeHFr7HmCgOtBLbZiyJ47eelfUp+bwHmURTVygWkGwm5R6
	Eh/2ZbXiAoNVZoakuLqbTNjklp3jHufCXmejQX1TrtKF2267JcKWEgXeIRPdFylSiMxHFyeQOSG
	7499l3D+p9EO396jpo79MOpYOAlSqX9z8F1C22t5i6PbHrTrLvtie5ldqdZ9I4lKChBVvYXNfG7
	Al11KHVbFETrJpGFLfgdsvVtbL09I1FXUUuNqyQhswQ5010aDW9fnJ0imB8NiSpaaNHbImx/usH
	3rKTu3ihExuHdoWHE+BEGs4HM=
X-Received: by 2002:a05:7300:6da7:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-3856c9a3029mr21952592eec.2.1795537109414;
        Tue, 24 Nov 2026 08:18:29 -0800 (PST)
X-Received: by 2002:a05:7300:6da7:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-3856c9a3029mr21952557eec.2.1795537108894;
        Tue, 24 Nov 2026 08:18:28 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm41066407eec.20.2026.11.24.08.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 08:18:28 -0800 (PST)
Message-ID: <f521ca85-3cbb-4209-9ee4-63e3c8cdf0db@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 09:18:26 -0700
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
Subject: Re: [PATCH v4 1/4] drm/drm_ras: Reference-count nodes across netlink
 handlers
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
        riana.tauro@intel.com, aravind.iddamsetty@linux.intel.com,
        rodrigo.vivi@intel.com, raag.jadav@intel.com, simona.vetter@ffwll.ch,
        airlied@gmail.com, kuba@kernel.org, ogabbay@kernel.org,
        lizhi.hou@amd.com, karol.wachowski@linux.intel.com
Cc: carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        youssef.abdulrahman@oss.qualcomm.com, Sashiko <sashiko-bot@kernel.org>
References: <20261117233442.407877-1-zachary.mckevitt@oss.qualcomm.com>
 <20261117233442.407877-2-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261117233442.407877-2-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05b8d6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zEiQH73GkW7WTHCCbtkA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfX8G0iZcWLCu8q
 ZMScHslJV5PJk+cgcPxgfGd2vomDgs/UBQFfMtXcJ5gC1VY8IKxxDzQNgkpahkRn3fIsq9UEwEu
 6RbUw8Q1KY1Cc4KbsTJpCDtzfsy/xaw=
X-Proofpoint-GUID: -3XBIzCzTGa3KRXU7jb9YiiNnZgacISL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfXyyWY+F6/H5Jk
 lseeq2XHohTJ0B9mwmfA6Xejwyscz2KIzJ6N9QFwTpfPlzhWENzPXisSUGSOvYCd8bHnIlnpy23
 LQjDPeusme95XB9eqGqiook1jJuR4icv3I5GdgreJG7pWUujlbxN+8a79JcLyLuza0Al+spISe/
 EJVcs9K2XgO132QkVkJ/xf177Y0tQgUgMADP2oTXLiuTeqjU1FIe5dG0qjAI3m7xvC7oUPz9OO6
 cZtEdTmeohrUb7Ztxllacis+OFN4+CdncaL4hGY3yldJayqxsLBdSfq4+LjoBKSufBc2G7l1Dhz
 Kkp4wMGGVYwP/AlPjM50qQRoRi7j/B3ByJFNt4gRAJGoo90MZVdWeKK/TCrygb5/5CNWu6AAdnu
 rDnAXLfnOnaYPHGKZj3J/tttTh58rBIj1Z6jBsjtBVkQSU35OyFV+Oj/mh/5/CPZpoa0CZ7JNXr
 YLNLpgqRpWh9o4/AefA==
X-Proofpoint-ORIG-GUID: -3XBIzCzTGa3KRXU7jb9YiiNnZgacISL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240063

On 11/17/2026 4:34 PM, Zack McKevitt wrote:
> The drm_ras generic netlink family sets .parallel_ops = true, so its
> handlers can run concurrently with each other and with
> drm_ras_node_unregister(). Every handler looks a node up with a bare
> xa_load() and then dereferences the returned pointer across GFP_KERNEL
> allocations and sleeping driver callbacks, while drm_ras_node_unregister()
> only calls xa_erase() and the driver frees the node immediately afterwards.
> xa_load() only holds the RCU read lock for the duration of the walk, so the
> node can be unregistered and freed while a handler is still using it.
> 
> Give each node a reference count. A node holds one reference for being
> registered; drm_ras_node_get()/drm_ras_node_get_next() take an additional
> reference under the xarray lock, which serialises them against the
> xa_erase() in drm_ras_node_unregister() so the bump can never race with the
> free. Handlers drop their reference with drm_ras_node_put() once they are
> done touching the node. drm_ras_node_unregister() removes the node from
> the xarray, drops the registration reference and waits for any in-flight
> handler to drop theirs before returning, so the driver can still free the
> node as soon as unregister() returns.
> 
> drm_ras_nl_error_event() is left unchanged: it is called by the driver with
> its own node, whose lifetime the caller already guarantees.
> 
> Fixes: c36218dc49f5 ("drm/ras: Introduce the DRM RAS infrastructure over generic netlink")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20261106181225.3333260-1-zachary.mckevitt@oss.qualcomm.com
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Looks like you break reverse christmas tree ordering in some places 
where you modify function local variables, but I'm not sure if that is 
the expected style or it just happens to look that way.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
