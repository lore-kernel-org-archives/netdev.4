Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537263;
	b=fKtgTikh+/qKZsNkGJ94WRI3M76gjzP1S8LZGPyD6360DUJBVZGFqjp/OkbOSuWiYklo
	 dr04wctjvzMq11k/XKpCjmkHlx091rxpED1Bts8iHSy+PPISWiLft2xQ7CA36ZQAYgxIz
	 GY/FvlZtZzpnuaTvhSA3NMif3P0v39DtSSvZ+5DOTn+pAlaoerrveCVxtwpYKDPd4ANlw
	 ToeairlmDaqnCO7eUW9u7RTV5unjk9UuClcoIItGcRusqdMeR3H+JiOsxOsHmRl1AEIb8
	 eG7uNHjTOF/DPK9qlhM9kgAhJ7gD1d9C5Vx2zLb504sS8neJQjAGSqZmp7IFTPkykag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537263;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mJq0o03FHPFQQViwE80kGn7rajnxnhmEKjNzYjrNOL8=;
	b=tbAqKbNglRMCAIMM8hYVGaHRfMyhNMInfyXMxqMmZjExuVuDx3JoI8qqQiWs6pSdSVpI
	 uNBqeo2sewmRenMwwakmSaOzi8VgWir9X7IWPU90UqimF1inN3TFEX/6Oo83GoKnrFlpZ
	 q4KnZNvhosk2D9ye0P8RuocPQ454HUf3As6oWGzOszcjlvHAfGs5lJr+td43yXuJ8nHTc
	 ulSrnqCgf1gDWKcN5D2ePpPPTDt+hpEpsqvo2ZY/c6WDFSDLY81CvWTSCy/l/aAcoCjo7
	 LhF9nHV4WuKb2Ez2s9+m7lJgDcaCGaE6kZJf8au7hl7S+BOUQkLvImtW5G65zO93MxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YljUowSR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8ao5uhZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABB6606A687
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ABB6606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YljUowSR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8ao5uhZ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL0sb699934
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mJq0o03FHPFQQViwE80kGn7rajnxnhmEKjNzYjrNOL8=; b=YljUowSRGEABkA5i
	12NyjGNhYPmsChZwE/Rz90ugdZAy02EG4uCW6Iz1rqpD/O/v2+GlYsgayfpv2Tot
	rOtnem7ZRt2zcOlAW9a2XLxKBqdHnAXkBOIds5j07IuYlOy6Vq5vM4e50/BgwFAi
	KVRzH494WyDqr8Msmg3lrLKMSr0nlWckveSq3+inGdL/JPB5jPsxhZBamm5IJxPu
	6FClp5pNt1VrJTMqP93qKENmzUq59BJJH1T03BEuL1FNFJz13nL5KauVJuydzUka
	p0ejRkRyv9QxyOqnxhpvua/mTDKuq6jJCr+MTD87N+ekFfEM4gV+IcuyOrkEdKFI
	xU5f/Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f43ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:21:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38355b03cb8so4707947eec.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795537262; x=1796142062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mJq0o03FHPFQQViwE80kGn7rajnxnhmEKjNzYjrNOL8=;
        b=R8ao5uhZ+omdpwlK4VA6fihC7QgqKGUzA8OLn/GBQy5YTdhZ1a9byA+ufQOpeOT6DZ
         KJpliw5Iiw36hyNMgRB3+PIeipN9R1/rshK/qDRcj6eN6tLRnIatC0Iaz/flYxU/B63U
         in0MUayIuQB244EC1ppusqfNlLzooqbw/7BTgccwKZLcIHaM2+zZ69MOC3p3/jIFOhw6
         pyM16hYtlU/YEgV4V6+6NPxafzXF1t02TMZtF8/53emBTmgH3pu5Goz6BicfowjZvpqd
         gKC+QMVEMZqqqgQOaQ6oI28EvbBaM8o9pPLRLArcsIfeK5N0d9jyT4aAkl/yP1UgPKhJ
         4CLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537262; x=1796142062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mJq0o03FHPFQQViwE80kGn7rajnxnhmEKjNzYjrNOL8=;
        b=KDJGJd5ddF9hNItELj+XefF4ltZU8VQK91C1CfS7XHnuc4HRhcf7bbYkj87Hp2kJAy
         w5GYK7HbXzS4hN4DiuwGDOWaa1xZlVHAsyEALeGWAB6fd+uTUpbz/lYkOZSqPddSLmvb
         C4VzC9vQMOk4xUaDTXtimJ7CKhhU5eeG7cr9UlTzZwzq+WWDB48Fsl2Ma1xdP8aL5deX
         IPFvvoqo9FkHSCXr8Ih/kN8ad9nWzy6D+SbLIPLUdO/PHRTKjL97V7nPS2S7VOyngIkr
         loIU8NUKJzvmF61uSxamWinkBH71HDaZ7XnsEWuyRFPUoZseXWHwS7ADoP44vVP9Xdij
         yCVA==
X-Forwarded-Encrypted: i=1; AL+hErEsse/eA3rsh8HkL86cTeJiNYmwnV/YpO4AYoL+Y8GW28wzxkrMzPu3xJMiIE89QZgOJWesPgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bPndSGTFRyKHP1pyXtgB6pM4p+TO8EZ1gNCKMCdrPZgvfnV/K
	v460eBJlyMoJB3+vMV1zXrvOirG0gBCDlEjrYL5iTZxXxxp9P+tKOgxKAE/usbOe6DdUT8XhzNU
	IpPfRLFj5P3lRMaugYbsljuNVc2YanH2p/JR6Rr31/l9A/bGqXK1vpPWnFZk=
X-Gm-Gg: AZFdTZee1Dhu4WUpWtOw2KaA+7dYsdQTYLhH3d8orwzT8zgdATniRw0y/OB+yuBaJBI
	J081wfR6eCuIrqLYn/gKzq8//Ko5sCK8tHJXbRBAvF54hmIGOn6lE83XGa8U1KarABi3JV3ORxk
	IU7LMC6XA1QEEcuvn5U3TMluQngw6AA8O/oJyie4+DFf92auDIFBdaeciCFlPh5S6DkSiJKiUKa
	MeBdTRyumcWiZ/yQVMyH4eydUxPFTCzaHSzrsI8ZcBdLHgD5Ie1C37ri1a8XFb80sqXm96RqC+G
	phYeup2v0/NL3/SF5rhEntv+BUpZdlPsoTPf19Y5aVFogm7samThpD9PF4BFfJ4Fdij7JR6fPfp
	3wI9pGfLKPSYYJnHaXEyAaklYcjnc+hPxbOeAHMiDNxApKdvVsTs5qJi8Ce7ywrilNB+QvVDnxv
	YF5T/rNgxv5tV0rgJrwxTz4i8=
X-Received: by 2002:a05:701b:2508:b0:1b2:3497:5998 with SMTP id a92af1059eb24-1b5568f03abmr13957299c88.36.1795537261731;
        Tue, 24 Nov 2026 08:21:01 -0800 (PST)
X-Received: by 2002:a05:701b:2508:b0:1b2:3497:5998 with SMTP id a92af1059eb24-1b5568f03abmr13957253c88.36.1795537260729;
        Tue, 24 Nov 2026 08:21:00 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm24508184c88.4.2026.11.24.08.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 08:21:00 -0800 (PST)
Message-ID: <6dd9fb59-3043-403b-bf62-a2d204f8de85@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 09:20:58 -0700
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
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
        riana.tauro@intel.com, aravind.iddamsetty@linux.intel.com,
        raag.jadav@intel.com, simona.vetter@ffwll.ch, airlied@gmail.com,
        kuba@kernel.org, ogabbay@kernel.org, lizhi.hou@amd.com,
        karol.wachowski@linux.intel.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, youssef.abdulrahman@oss.qualcomm.com
References: <20261117233442.407877-1-zachary.mckevitt@oss.qualcomm.com>
 <20261117233442.407877-5-zachary.mckevitt@oss.qualcomm.com>
 <awWrm4Q543mvU318@intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <awWrm4Q543mvU318@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NCBTYWx0ZWRfX63pK3GCzUIc7
 jbFnQ3P/SpNU04EXUgymf3DTB4Xxh9TDamORj5W6BoPxEFweYC9dP44BfSChbJHDnoYsj+81bX3
 Q+3s7OT15XjiwBcvqJgzxJc7lW91C+0=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b05b96e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BKpwa6Id5kTLf_hP8D8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: eRL59XXPgWTSVMX_Ul-2XkCJJsUyvEo7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NCBTYWx0ZWRfX3KNta7i/HT0m
 fIhQxPCHo6mpz3Ji47QsidyiftVBROaC0WR16vhoZ35KTEZe77E/UDvpkkWreCwbUBhFwkQdqzy
 ZwfjHBKCZI5JBDxIA6PuSrx25zFDLLwirt8hCFX9MDN5ttv6Tf0iOONZM3InJAJ/yWVr/YCqVC4
 AGbQOcYrcp+Z9MvKipj+G5BbIhV5OlfRPTn4VFc3e1P7vfDuC+Vf2RmjISPRhAY0qImiRd6SOw9
 JqyY62D1KolwJkQLPpwdiemrRGJ6zFGuLVMb7lC+xeitwPaX5vodeHu+pTWalrCGLccAijRRbfH
 DnPms7rATJTafQSvh7Z9f+M0SABF+0ZmezV2cs5LNMkrUD/sVLTD3wtNvbqGtaHsG9hTo6qFxCl
 wFHwIxbxAjdGII9lf5+FCCbTRFe7LZxgS077L3MKdZJ2+tXwEZ4Gcfk3J4oX+tCRzLII58gTr3k
 YpbIB3QxRbLx4cDCZ+A==
X-Proofpoint-ORIG-GUID: eRL59XXPgWTSVMX_Ul-2XkCJJsUyvEo7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240064

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
Yes, you have my ack for that.

However, Zack mentioned he has some minor changes for a v5 that he'd 
like to do. He said he'd do that ASAP (today).

-Jeff
