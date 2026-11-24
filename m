Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540640;
	b=bpsDqWlbiEhCJEi5w8E14fOfTyesmo4kNQwsg+470WhV1jgOHJ8Vnlk8z2V9H+gkwBkd
	 pV8ebfvljN63XY/21836XB6ssytYBd7+e7oXIiuJx0X40PKool14fSmgenOQlJYMQN7G5
	 9p6RSrOnO9qDxergXoWsVLRHAYjUVi89av4DYWiGlbRY3gUwmOVa+Z3NmrTUMQT1aYIYj
	 FV5WC8ghwwPS46gzUV55Se4GgPEmk5iITT5zwB59mMl1GuOWna4NFGdoaq0n2n0OagLsq
	 AX+8tMr/AwWhPPO+1TZXKAWMLeuOAu1iJpL/exw6QUoa8lWIpDyul6zU8Sii/gTH2Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540640;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version;
	bh=2kbZ1daghVq/jTpQQaRq8WPTs1DM1ouWO34muq4qlDs=;
	b=MweAPe5wOZa4koB0O8WBdtVdE3iK89HgRRM6bbaz9/87+0Ts6zeY3wQEUTv+aMIZuccy
	 DLvGMfCS18rfkMRvEv+4l701Vn6pEntlHejsRKTcbzBOdlQew1puA1hnl//OqaD1uAM/J
	 sFQ8fm2vUslS1zYvfxWMApYHHkqWwsM+BkJnWohKODoUubsB3iG+/hdLyEqZXjLyNGsfW
	 Lnv02E7kk74pHvnBg6JZSsPZDEXH5cxugO9alTZBX5nqb5xoMXSr82zCc7CEafcvBnTCU
	 f0JJ0vtdwQC3KiK/Zb3xdKvSX+52gpKWyYETdnXyyP8yXI5aUtZkH/yl3Q1YZaMz7JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=cfV0JxHv;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2186606A32E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2186606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=cfV0JxHv
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFKmd11420523
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:17:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=2kbZ1daghVq/jTpQQaRq8WPTs1DM1ouWO34mu
	q4qlDs=; b=cfV0JxHvo82k46xLI8NSqwXbKTnafYvccvob42Rrp5sjIEXdNM79h
	KZnuagIldyQrUun6AfcCKANqmmmRGZOh5dhPvaDBUQMvoaqjVX94SitGlSo1683v
	4KThYEGP7BrkPsXKCFh+BDkAlGolvP27bKv0lJ0MPC0Iz69tD3AXbQ/sli7KiH6o
	0ngGp9anR1fX+J+AB2WyNyzOaHkRGiPbpcxc65jAPaNYEWlc74OGk5rHOmH9Rdl1
	z6zBDxpvwO6th4xoSGKdRxdWT6hSh6Q3KFWfxdPyDxZ4H0JFoG/iAjzK9QvR/soy
	/UwWulrVPf94So43broU5PXtT+N7Mx6/g==
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j406y6vth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:17:19 -0800 (PST)
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bb93bf724eso4612515e9.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540636; x=1796145436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLybSdI5qjTND8zPaR4Rg194Q2UholF5MWi+zjXHA68=;
        b=y0xpkHdQFV3FDFXKX2Y+p1v+EkqJwLoLA/DN1nSCkS63zjsrUa7Sb0g2bz1TddViyB
         9l3ZAGhfOfhbrs+zHDvT5QkDuKEWzV+/JjN79zF+M07wltBy7ulme0M/vSEOEOcy+MXW
         3rejk3Kdh12h7jjaRTpZj7CROcPfSZ4JQupJtJUq2mzOEm2GSz+BAFwlRgzqYiBggKqY
         7LvxHBijRXgTWkmOIQmn/r8gUDvH4nGL5hSTWLzz7xh23zj7PPinhgMcG0+iLjEuQ1Sl
         q9AchFwEN8hiXuFVNSooKB5/dlpwG0l9ctSFyw+9/dF1nbeEiEcb5GwtvXXf8CjN7qph
         FjFQ==
X-Forwarded-Encrypted: i=1; AL+hErEn4SgpMz2zpby3ZAlZ0qCdi/c0aulxXczwUUgwB0wzOVD2QckY91zm6bbDpNNzc8hXB71z9iI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SsS4l2DV1x0OA0cdfaRFTnhIiIwa1QAZhVH4W6AHimnOubzl8
	F5tgPMUBHwtha6o44wBmPp2qMxEzF+JN2oA0gIFIkX4YysBhaZHVFhKjpMIavieSl42ughzqLTe
	MQQMaGW/ilU2+sAcNrsvz9xa2SdBW9Q7dbIJ2hZGnDzvD1SMWMLKfhcbZMQ0rc5OTano=
X-Gm-Gg: AZFdTZeCrWQtNfVEaaPJBEru58K2iygFIlHMBiTfZQNh5uzinPITPMnx6OttCdvE3ti
	z3yu1T9zphhD+B7STogMWJJ+ByrHGRpGmP0tqsnfHHlZtItfL5TnAmcWawBsOnDP1P3a1C34dJc
	97tuKVvaYQv8RbqWYPZDdzsMaUwuPadx/m7u2Ffran3e5ktIgNoK4E3SboLi2JyYxuNc+BfPOF2
	E+VcldQbGvmrQTaaaAaSylfcPMCaP+2s2Oi52wFF8XL0hTjZX+p6uYQNL2LrIvKyTiqFvUgdTvL
	YdXQzrqimt6d5Mjlc7pTqzxqWp6Q3lxvdtKEWFRrs5TxJhZwFYfVR9hbUiVVFlKepD3EfUeZUZa
	XAyPnFEO1XwUfzaQVmsWEDBk6hEKEe0j903NXkgVbC7kuDXsBVF+0Tagseb180tcRgbnt40xgIK
	S3UvEyI9M+4aHW
X-Received: by 2002:a7b:c84a:0:b0:4bb:732a:2837 with SMTP id 5b1f17b1804b1-4bb887ec609mr231590575e9.1.1795540636414;
        Tue, 24 Nov 2026 09:17:16 -0800 (PST)
X-Received: by 2002:a7b:c84a:0:b0:4bb:732a:2837 with SMTP id 5b1f17b1804b1-4bb887ec609mr231590225e9.1.1795540635965;
        Tue, 24 Nov 2026 09:17:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:3f7b:7276:a343:d339? ([2a01:e0a:e17:9700:3f7b:7276:a343:d339])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm449546995e9.5.2026.11.24.09.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:17:15 -0800 (PST)
Message-ID: <7d6fec4b-e9d7-4d95-91b7-0319d44b25ad@meta.com>
Date: Tue, 24 Nov 2026 18:17:12 +0100
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
Subject: Re: io_uring/zcrx: copy statistics lose updates when one ifq is
 shared by multiple rings (Data race)
To: Pavel Begunkov <asml.silence@gmail.com>,
        =?UTF-8?B?5b6Q5pmX57+U?=
 <xuhx@hust.edu.cn>
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <375d4b.2ad09.1a202324f3e.Coremail.xuhx@hust.edu.cn>
 <c60f3a12-4a54-43ec-b1e4-45bf43deff57@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
In-Reply-To: <c60f3a12-4a54-43ec-b1e4-45bf43deff57@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfXzyBEOv2T012e
 t1yXwr+F3AUsUvOnA/l3BNCEHtTdT/sNMpuMyFHJpcz1cIXBjuRMudUJra3DZysZqL/fsDsbkno
 bbhzzObl23oJ9KNq4kGz82y0KeMGE7o=
X-Proofpoint-ORIG-GUID: mKyldCF0Wlvb5Wki-VNGc5QLkaA0Hv2b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX2mYhwN3thkgB
 wYJeXOMPzHvWAHsM39NsFa/xNMHuXvKhjO4gtgpMAPOa8E+HXceEXwi3VzzC/pVyIzEM20dVAxM
 moJJpByhJYWlpX0sbZv4oMfONGL4fvYGfKgtRP9r4NghqqCPooFROo3diF7z93RQDHg+ArvpIhT
 LT5v/Hybf+HWEMPZKWpmOUKFsdGwGGuCkt0j2R/PoT7Wqa3SqqoKcUD/h3bCPiKAAP6eXSvXFyZ
 Kcuvad+dxLX0ZA15XxYtAXOzf9f5xzB/FpZtN2P5/P9cWho7L9EvFDuYvaPM32/WzSaTcvvpgTD
 37HdhlVCzXeoa5lFh3sA7iDqoGlzd1DIUWxpP8qxLfhyJ5XLIQRWMWv+AcOQny3CXRn+5Pg8GxR
 ILGuKGMjgqXIPkU6PSW/lZ5nr7i6YOYOOCOpuQgQxSmScElCUfl/3RdGzltCYWP/BSyMDuyFI7Z
 AJwbKOpygc5yzXqKSGw==
X-Authority-Analysis: v=2.4 cv=LOnz05W9 c=1 sm=1 tr=0 ts=6b05c69f cx=c_pps
 a=Ech0Gv1thIkdqUNjVc2Ehg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=4h92JMTCafKA-fb_NiOh:22 a=0yPqhiTJd68MZZuF_Q8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cZgK7WzY9ta9U-6s7oqD:22
X-Proofpoint-GUID: mKyldCF0Wlvb5Wki-VNGc5QLkaA0Hv2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01

On 11/23/26 14:50, Pavel Begunkov wrote:
> >=20
> On 11/22/26 07:39, =E5=BE=90=E6=99=97=E7=BF=94 wrote:
>> An io_uring zero-copy RX ifq can be exported by one ring and imported by
>> another.=C2=A0 Both rings then perform receive-zc on their own TCP socke=
ts,
>> but they share the same struct io_zcrx_ifq and therefore the same
>> ifq->notif_stats.=C2=A0 The statistics update is not atomic:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 static void zcrx_stat_add(__u64 *p, s64 v)
>> =C2=A0=C2=A0=C2=A0=C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WRITE_ONCE(*p, READ_ONC=
E(*p) + v);
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> io_uring/zcrx.c:1337-1340.=C2=A0 It is called for copy_count and copy_by=
tes
>> from io_zcrx_copy_frag() at zcrx.c:1770-1771.=C2=A0 There is no ifq-level
>> lock in this path.=C2=A0 lock_sock() in io_zcrx_tcp_recvmsg() is per TCP
>> socket, the ring's uring_lock is per ring, alloc_lock only protects
>> fallback niov allocation and is released before the copy, and
>> ctx_lock/notification is taken after the statistics update and is not
>> involved when event_desc.type_mask =3D=3D 0.=C2=A0 Two CPUs can therefor=
e read
>> the same old value, add their own increments, and write back the same
>> new value: one update is lost.
>>
>> The effect is limited to the UAPI cumulative copy statistics
>> (struct zcrx_stats at include/uapi/linux/io_uring/zcrx.h:83-86).=C2=A0 T=
he
>> values are user-mappable diagnostic data; the race does not control
>> buffer lifetime, DMA, reference counts, or packet contents.
> It is racy, and IIRC Clement dropped atomicity at some point, perhaps
> for performance reasons. I don't think it really matters though, the
> main purposes of the stat is to be a flag saying "something is wrong,
> setup steering rules". What's your use case? For precise statistics
> I'd rather prefer to add a trace point, which would be able to do it
> the right way (e.g. per-cpu counters).

Indeed, I used atomic first but then we dropped it. I don't remember=20
exactly but we didn't consider export/import at that time. It make sense=20
though so atomic would be fine as well although with an additional cost.=20
I'll let Pavel be the judge but agreed that we do not really care about=20
the value itself (there is nothing the userspace can really do about it
except check that "it's a lot").

Cl=C3=A9ment

