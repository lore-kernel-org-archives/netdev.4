Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954607;
	b=2fFLcvYz+2NpGJTMgm+H0yWtKRia/gg3RwfjTsSWbAPcfECq5ieifMnR3SOjuj2hU+po
	 hj49buJv3RQav5xUbtsRegBhWo8B1AflHsmE1kVLryBel57RX+RU2O7L1Ifrbs5CAYiPD
	 KXMNxDf2ngjGXGpT/PUNqxP7pXZpNFFmlQTC7cx6ydkzd0VcpCsnQR+RpGVaEeT4roWP/
	 a1R+h+ZQzrMxbbioi1mgmxkhro6OV18Lt37BaYR7NQxhvOH9hwpEDI2NS5O2aXmoncxYY
	 MFQ3QerZBZX1bO/mkeSBJdEnAdxly7lXc6kHMCNuPbfgnkb/HE+iaAvnq13CbyVUxRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954607;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=KyDWO0/aXgj9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=;
	b=aSSX8QJSFUL2q/MerI9lsRvqcEigvlQucnjvPW40JGmPyStRvGC+RcHZnP3uddQyeI1Q
	 F4VmPdPNW/91B46Di9yDs3UN3N3zUmBTvB/Siea6TKIbH6Lh4Np8RBl3B5Ho2sVDEWj1d
	 u7CS2dSklRbpIkGlBGETtpL0tMNV3A5fy7Cw7uSppQVzE6nG6rEk6gnSFSfCwvqViry4+
	 eIOiqjrAWQipE78Q4YCg6KQL0pM2GjIYDBcIobFFkfQwX7PvB5WUnRAsgDjLzCkZOn3nC
	 kaPn9k4pXjrMNP8usIsDh3W6RgxFMfm7UdXEWqlVWrSJZxEk45zGT1r9anW7QjZwXgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bOfEnIBU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72F5606A333
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C72F5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bOfEnIBU
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM22Zx1750306
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:30:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=KyDWO0/aXgj
	9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=; b=bOfEnIBUXJ7bXz2NrfMubG5jwGR
	6jN9LTRddaVvweRF6J6poXO1rNj6AwMta2gKHOV3hwyI88N0Ig55OW1IcebZwrtv
	mc6yE82eh5XbzOd8B2PGTR28CGWx1oj9Ay/mzcEzSVSMkGfaG4LYgl+dpJWjuvvD
	V1ZmON0tX1Osf2Lm0wPDir0fCLzcZuRoYUsO1Iy4vMbA9POOA+6JH40mOWi3TCsm
	dRTW56gk4loflTT37NNmVrKcvR2hIuxQKe3hfu01wDEigH9osq5WP3LFJMTv0UCJ
	vUJBimgVSMDyiDFY/PodREJjfSxqnIOleJ/qCq82tGOD/cfLXNpVqmZmpEg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0rk6nfkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:30:05 -0800 (PST)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3b0ebd98cso209902a91.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794954604; cv=none;
        d=google.com; s=arc-20260327;
        b=GxODomSYjv61jgzLmIXtGgJmqMibSZPrrxYkp4b7xXGIFQE4d/sh3NVQAtAmymdQof
         uBBaX4NWC1Ya5FfyJhvcFhTGtphu9Ld1CVHNorQwqxFteWV8I4KHtoxtjVKprWlcYInB
         msli1Zc12jwkh2H+oseHloDBqQI9KZxRO7+BXZHoRakPrXeVCjBxQsubnUWIjARfsfxl
         WkeSooXbiwGxkmrflcRxOBbv9el3iqJx9AEggukzoQLEMaWREi1dxIgQtpZomHRt5b/A
         XtbyDHH87vRgGKByBI6u3jGCEP2yf0IZpP6JBO9S5wnRcmhTHVP18o25GySnUuX/Z84B
         4NfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=KyDWO0/aXgj9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=;
        fh=qod244yoB3Swx6BT8pwI4iCjWBm8w97P4EwtSYE3820=;
        b=AAfkOar6a6xKxPj6D6YY1zo30K3F+eiIQy8+88IrvS09b8ZfViLkv+ex7bE7EBengH
         hX5WMEPYRfuJTS17VttNvMFcxp4thXKMna5t90fwzbg2ENc8VrlWgs/QmIPld6p5M+dA
         6XCrg7s3GB6vuPirops1gafx9ZTE5KMLFGwZJRav3Znb58vUFLbbwAOsdWM1oLzKwdBJ
         2V2RRjrB3UREbk0/qGu63sLvhJZ0qHYuySQd9aFUqkhUlxgq8PsC8wGYmbHh4KSMCA0c
         seB/SrjMno4SgAOZ434gois0tFJkXHdeA1GJ6ZIFodl27jVF9kQ2qCLA+vNdwehSd054
         2Jbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954604; x=1795559404;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KyDWO0/aXgj9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=;
        b=rPjydYl/rZqYvRGb/vE/i+3mtDSxUsKW1AOGTphSOHayDJ0dWG3Bwnw7xHjxbO9y3y
         2sYD3jyqZsuPDe9LiDIejJos4qJyhYrekD0QcXMEs+FFaL2LZKO8zCQUkxzATQrDMdcm
         B7tO3v7ol6ojaoJIm2Cti6o8tM1tMdPaYTdSv4mD4s6y8ZQ2VCmzWaacm1EESqDSCTZr
         H/4tBQwVquUM2x2V/XRXE7YCU9KaucsgGoZUPg2In6AD2oSvR6oLkc3g6xSU9KhqFFTv
         S6HdbjuIl/CokTqijTqV3HaiRyBgOe+941BDKc+swNoD0NSqs9PJxDEC1m9WM0Wdwzgg
         2bDA==
X-Gm-Message-State: APuU4Z/GmpKcMex/Bdnr3lgvsjdg8x4Ol3h/VQbWrkKwUw+YIYyWb1+z
	ngZtyHjt0p7MGKAncmsqhuI6DH4TmweBms8JEQmyta0fZPHLYtosZzK1A71PNicR33IGUL0oFjM
	KT2wX0sDRS0YyO4YkUJV/FZ1GepGUxvDJppYfloUOT43rxoohz7K3IgdfM9fQYJG5ilhPCvOk8c
	XtLMnAQeNuTYS84iTzSv0C7lqqblwf1NM=
X-Gm-Gg: AZFdTZdJzvF52n9QnUG+cJ+p6/xtlDqc5RwvmTv5UtVd7XHiYRKM8wFhJW5PVT6e1JL
	TvGVLccDYerXboSTazlg+Tfc5o3djsttYRueGJrxEMOnIWLaOGhQe5C7PnjESzLEVJSv+aX9Wnd
	jJkNgiIqE2pP3cJEXXfvvI60vp8qlj87HuMlDrTbiuz7Um36bPZ+xEv305cK8SLobpHRvxCuPCs
	jE8N7ToX+aVwql9+WJwa9euMV5MY9c4N2v5JEj/rRzlN2cpEYc=
X-Received: by 2002:a17:90b:2fcc:b0:3b0:b64e:1e34 with SMTP id 98e67ed59e1d1-3b3d07d93eemr814950a91.51.1794954604505;
        Tue, 17 Nov 2026 14:30:04 -0800 (PST)
X-Received: by 2002:a17:90b:2fcc:b0:3b0:b64e:1e34 with SMTP id
 98e67ed59e1d1-3b3d07d93eemr814926a91.51.1794954604046; Tue, 17 Nov 2026
 14:30:04 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-8-toddfreed@meta.com> <179471270091.2199510.4320994626979041884@kernel.org>
In-Reply-To: <179471270091.2199510.4320994626979041884@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:29:53 -0800
X-Gm-Features: AclHuK8ozq1AL-AsYPXNzCLCrFAtXWz49sr600reWw55cTUb-tnGMH92_LvEb0k
Message-ID: <CADh2yMwoR3ZJUwCSbUuY85qPN=c-TKqb6BZeB87q=B24tTTaRw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 07/15] bpf: don't redirect decrypted skbs from
 egress to ingress
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: SYul29OmBJes1Fsu6zLmVwmrqcf4TJG7
X-Authority-Analysis: v=2.4 cv=Q7xHcI2a c=1 sm=1 tr=0 ts=6afcd56d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22
 a=DLdrzcY1xBZ9M_96H7gA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: SYul29OmBJes1Fsu6zLmVwmrqcf4TJG7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfX2KURcPtaPF4J
 Z5eC8qBNh0QG6Ot+QeGDX3MQVYxRiuEEWMuTPNhuSKf8GIoWOqN3ZZ/+/JRPbYVnh/EUQutK2tQ
 iYc8s/Vvr+usul89+KuMoHbU9vMquMdqaL59tdWQWlMzvToclBVll4vj/Wya+0LqOKuk7c1g9od
 FotTkfss+Bcf5xQo5PsfsQuJceDlc3Bj8h/NzKRxi8P0Fod0zjfc0WHCDGLU+oG6HPmjo/7mw+X
 YSOPxDE6JewqOvps3UdtvCx6eiX0ay+VlUOGoLNQ0Ad+YYhrs4k9azsaeFl7BZtqUXqNwNnwgBu
 7riq2yusD0fEeBpHH9xjeO5LoI+x2hR94e5MPw2TeQeY/+wsk10sp0UwDeKKgrJhsIMxD3DeZS+
 uysrABaJWPjhMwXUoD6C2JLQlZ/+IwF5kp1U7QDbE7MYL0LwgnIvqO4Amh29zNMvSqBKF+nrjXQ
 U83lPSGR1CP1uy5uaZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfXyl8D74SnM5cT
 pYa0Kwb5CfZCivYpscrTUMde71sA/zRUiBV0Ae1FemVxsv5BWn/T5RF0Ffstcd/WaaDx+wA8n2e
 TgDZQJVpoJj4deMBc6WbzwJSQFyFF7E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
> Is skb_at_tc_ingress() a reliable direction signal for every caller of
> __bpf_redirect()?
>
> tcf_mirred_act() only checks this inside a tc hook, where tc_at_ingress
> is always current. But __bpf_redirect() is also reached from LWT xmit
> programs. lwt_xmit_func_proto() gives those programs bpf_redirect() and
> bpf_clone_redirect(), and BPF_F_INGRESS is an accepted flag:
>
> ...
>
> Without a tc ingress hook on the host-side veth, the same packet and the
> same program get -EINVAL, and the packet is dropped.

Real finding.

This patch was re-posted as a Fix to net as patch2 in the series
"net: don't redirect decrypted skbs to ingress, psp time-wait validator".
This path is addressed there by calling tcx_set_ingress(false) in bpf_xmit().

-Todd
