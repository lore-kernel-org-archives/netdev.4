Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795359919;
	b=CEdiSJdrhiR0IzaqWtyfMdJWMi/RjF+HQlvAdiV932vO48JZ1IeE0FCp/Xgfsgbl6Ow5
	 jyay04YTMRi9c4fAATXNRtHtr7xwmtTpTj+TGgJujiQOXXJO1ncPi88OP6HaqH962rnJ/
	 7vnK6LQ4SraadU+lZuP+zYNvzvcwG4nyak2e5vbp+GVN29LuIa99gSf8ZFVci6M5yWf+T
	 +2LCL6SmEGczmHbxPTMhbRclhcgWaf+2/M7n1S6mMQbRgEYd9cksefX7KOMZib+W0pf64
	 aVfKyVNzSStTyGCPqtpRnLXZeeL+u6/z2hjRo9+PNZzo9pEKsRs6yKEeB+x7ct0WHqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mvu2hRSv9VNrtPorrCskxdrDA3PVFViqcTkCEB4jfAI=;
	b=zXwdr40Ff3IreJMUNfBA1Yh6UTFOwcOIQhcNGY6UCHJVkyhU5nz9LtGtC0r3dBrItACU
	 H3pTeeLJ3QVPKIak59G+ObTkpIRowyThYCOoL6fBNK1+jId+OJKKTCEO4JcfWwY3Z7/Cn
	 OtX9GgR68UpoP9rEW4n8m4w2hsjsMuArI230qKw3Xk/ZVhGhscJ2TcKaT/U1XmsCQmjp4
	 3XDHVzcRiQco0NUX+Do2+WLHLkLOg2qdM7Wdtb/Ut14ZJ5VfFtBpPZrEm82cZZkUmzmpd
	 cQUbkf7aiHI9RDJx9GTxZr8H9pXs/BM0lb6GvOedmpmfiKIsAvtHM3vdIaSEQjDlg6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TqV69S5Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/4ftxKM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC88606A331
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 15:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFC88606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TqV69S5Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/4ftxKM
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMBjj9d109551
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 15:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mvu2hRSv9VNrtPorrCskxdrDA3PVFViqcTkCEB4jfAI=; b=TqV69S5ZkRsdsqAd
	VLC2a8JFbZUznZtSZtyqeaXkzdeA+CxvjWzTHDg4diPq4edORZ9Ajq3f5nnSCm26
	QFWVn3goXlQ3UcBC1PB0pzRAAUj28Yd4CLQRXvZZ0gaLLL7+9iAURke0ozKo91Wf
	LWSUOFJ4d9vnlL4JYmhcKkFbusN1mmR6IjzMW1RP4JOaFysoMWxmxleG59NZ1Iee
	1C7ilFrbCphRtkUi4N13ppYwfPz1mUPXPg+RsxcAJFR9+ADhkuNeXlpHt1125Z+p
	aMvXdDqaWDzDk7WRVEB2RR5OGkQRoUO8/57bY/NJtqgc1VqB7K2VWBxxKzGzg/6g
	nasuCA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j310fbw3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 15:05:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949dc497896so52753885a.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 07:05:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795359916; cv=none;
        d=google.com; s=arc-20260327;
        b=H5x1fb0QevEsECLxqzRFajzl0Pg4Flp5MoRkdJFwAzyg/HIPdRiXtL2Z8jt1GYdFwt
         aWPIujTR3qPWObbrEk5Tv1Aba886QU3I3j7deqp9eNdmd0c33fGzSOOjEtguQnn05s0G
         hchD+EF36Yv0SYjHE1k2mEurxsRVnKAMsG2RprbaYJrhYtxI9237r4BTu+OESlpJc7QR
         tuMwOaDueXPbf/p0GARh4NZWSJJRcJJQNz71H3yiITFajcBqHaUNIqTYJHIYVxh2yKs8
         VB4vIxXmt1Lqw9+IHQjr3XrFdRwAxshOFz76r7kqP/tx5kqBFsSKDPq5njl1sy3mdd7S
         4nZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mvu2hRSv9VNrtPorrCskxdrDA3PVFViqcTkCEB4jfAI=;
        fh=oNlvR+LeuZ/nkxudzZLAy+Fk7FwoOD5VF83TrJzEl9k=;
        b=lCqzMAJDsSmc+uqJZjq7OcqyK0QvCWAcwJ43gbXxbF1O5dzvmxGx3+/kZMtcM5Rb7b
         6AnRwMcrGqIWn0+WYlKb9zArbhPWPvBsi5Ew+wUg4lji0vH84j3BkrScClRBu3zWfOnB
         8HKbiTlFko4FpdWwcd+lloamqTAJo9Ilc9dQ3VkZRJDWJ4Xydbfs3V1YQMm7wun80Ays
         SruXWx0JZEGZ1qMS3sSoAPEA2OvMDXt3GUDpXTRCaLoRAPYlryLn2YZove9kUuMDwydM
         uTV27J3ulrQsWxY171ksol+ue+stXEkA1b/ea1wucT8eo9ALMy0tQIKbrSQmwsAlLYm2
         P+1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795359916; x=1795964716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mvu2hRSv9VNrtPorrCskxdrDA3PVFViqcTkCEB4jfAI=;
        b=Z/4ftxKMtQfOIb2KP1kNzDWz2Y6bySTaWgPKGRJAREYzXnuc+3+38Su9eyDZHBZPQ4
         2tgASRAbv8vQ4rzs9SBr6PVXjJQqIdszphP2sHV88HE2IBBsH35EteM9EFs0oP0mbxGF
         EgTaM20xsayoC0N9IC60sYb9YYgOj5u+hdvqmqD2aI2/xn2gPiZcpt2gI1eyTmIoCKVT
         9eMkkRTIxA4HzkRV02v9Xx9YPaDhr7mIDp70pD8jjkdrqutGQwTuwdl72KPM3LQOJ2kf
         lAwg+SQduGZo0Ycnfe0rIUJU8vZjAlTYc4zB34pAOQAbp+N3B9L63YR+GmPCdusmRodN
         Ctng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359916; x=1795964716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mvu2hRSv9VNrtPorrCskxdrDA3PVFViqcTkCEB4jfAI=;
        b=e4aPC6BnoB1ENOlxsp+GJKyU5XxdjKd2hCkIwlcZ3/4gzT25wbpyYCsdS0Ov6MilRh
         tA4zl/lGefqJ9kmuaQJ7SAjA4BdMWDQLh6f3SuhSVKqk1VVFAJqNiG/1s4VsQvUJeP7J
         PaeutTOVvEImTFhZqsUnjlPcCS1HjYUQ9fjWeCzSe3cQTQnmsLCy3q8HZzFhpZbaqvMq
         cQRkOqUYmwKEzB6Ie+Cf7hwZC7dgRsYZf7mFedGXN74PeGKFQ5gFElyGlRBy/Awh7VMe
         G3sEWkCv1g1KhpI3il9+wB+lH4d+AMITf5HvuytzWiF7PVg12uI1jALclKxLje8uyRe1
         bNWg==
X-Gm-Message-State: APuU4Z8W/BytXeV9BjGWiV4lFL4b8MwHeP8DDpoyrkMC//BJLosca7yp
	j7WyFmQURbAs/bFwoI9OekH8B2jQZHphPTM2/OG/Y3PFEQq2Eeqk/gN2UoJDm7xukj8Gcy0MYrP
	xMklSx3NMVGkOlfm1gzD5Pydk4nC7cQrxuF5Pi/80eu40iWvqGFYuV6/HCQQmwFAjUlrpeUy/oz
	ZQ3UjQTFl/r6xKRsDahgCpB1ocwyA4gzV93g==
X-Gm-Gg: AZFdTZe5ae4XhCVq97ZOYeXYG4KXzZWRZ/ir+jx84OOVZ5ZYt6atx6tUEvKERFAquJp
	EgmQHpJwXj7Dt4K7EU0xRSEqm8l6P/dk7Dr9vU/faNISpzY1cTbA+YuCTcEt1zMo2cyTST8aYG6
	+QI38slE0K0dhmydnFbbWAzIbhMdJnNiHnPmTagtDnzDsDnxOOOcikzofNsl3b45gd+SokBrcYM
	4Ze4Xk9ueW3uRtWJYGyqI2Wisu83jsP8KhZ1EQTECHU70W7seKgbPKfNPhwS7UNo16I6X2EEUPn
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id af79cd13be357-949ba9b8ee1mr1472738585a.17.1795359915820;
        Sun, 22 Nov 2026 07:05:15 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id
 af79cd13be357-949ba9b8ee1mr1472730685a.17.1795359915203; Sun, 22 Nov 2026
 07:05:15 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122050039.861287-1-davidlwesten@gmail.com>
In-Reply-To: <20261122050039.861287-1-davidlwesten@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 16:05:04 +0100
X-Gm-Features: Aa3M54om7_Bu2prslwxgzjqJgGVDuwBMZkqZHvyNbC6f6bUZvndDC16atbuK-9k
Message-ID: <CAFEp6-0_5YwOz6DiRKi_mNn2fCg7rJvYGYjOrVd903wdKZwCHQ@mail.gmail.com>
Subject: Re: [PATCH net] net: wwan: iosm: always send the host sleep message
 on suspend
To: David Westen <davidlwesten@gmail.com>
Cc: netdev@vger.kernel.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, m.chetan.kumar@linux.intel.com,
        mail@maciej.szmigiero.name, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA1OSBTYWx0ZWRfX8huOpo6cA2tU
 I5ZYMCRI2QqPeblhLVbOyS8o6xBGpHjffo0s67QMlxwzEtYsyGnohZFW4zO32Xco7LAkzU8d8y/
 RbH8iEtHFxvPlpdFIJx60vLVGF9wHZ61I/6facdWu+vWU3M6sTP/P1yhCStSY/nfQu2WqkHApif
 nWvDK87U191X09L9YDKX4vX8Rhe8wQpoCfk5EVk/2TzTu2/6AR2srVRB0P972RYv8hVM1Q4fVKv
 bSKMjG4skQmEzsI3QVybi2Pf0X/fPs08J1wg2fsgiX8IEryKUm9iKsdwpSFOZR5J0OFlYOu/zJE
 IX12x9hzkvpXHm1xHv/vkqY1k59e1JH/5hsGjHmatLd6It6vsa4lCZe9QUjC1NOydKCN2uOBQPb
 To4Sv4eSAEYuEvYLl/5QWhiL2uOjLRl2xYxaNaGw6CSTapkWVXBSDCx7nbReQjhKk9bCbTEIOAI
 4rTJgjuPhT6bR6AkLTg==
X-Proofpoint-ORIG-GUID: BhbzQDjld3Nq0oMRZ_j7t-B_uT5oK7CU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA1OSBTYWx0ZWRfX1BUe0mMFy6yY
 +X83HEv69/IVj78cguw2NEpIe6dYsgWYzQMHJ/RD8meHkNLGIYD97qW3vzpbyeHUUYIplGY34du
 4g2hxMPA1uGCANU+D4lq5btL4ilpI74=
X-Proofpoint-GUID: BhbzQDjld3Nq0oMRZ_j7t-B_uT5oK7CU
X-Authority-Analysis: v=2.4 cv=UN1Ijyfy c=1 sm=1 tr=0 ts=6b0304ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6kzURy52d_XsnYN-:21 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=KygpZSa6NscGoRIuHFAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220059

Hi David,

On Sun, Nov 22, 2026 at 6:01=E2=80=AFAM David Westen <davidlwesten@gmail.co=
m> wrote:
>
> Unless the BIOS reports D3L2 for the WWAN slot, the suspend callback
> only rings the FORCE_SLEEP doorbell, and resume the FORCE_ACTIVE one.
> Neither waits for the modem. The driver doesn't keep the device in
> D0, so the PCI core then puts it into D3hot anyway. An XMM7360 in a
> ThinkPad X1 Carbon 6th gen doesn't survive that: after
> suspend-to-idle its execution stage already reads CD_READY when the
> resume callback runs, and the first port open fails:
>
>   iosm 0000:03:00.0: PORT open refused, phase A-CD_READY
>
> The modem then stays unusable until an ACPI reset.
>
> Send the ENTER_SLEEP and EXIT_SLEEP host sleep messages on every
> system suspend, as the D3L2 path already does, so the modem knows it
> is going to D3 before it gets there.
>
> This ignores the BIOS RTD3 setting for system suspend. The setting
> only selects the sleep protocol; the PCI core chooses the power state
> without it, and here chooses D3hot, which the doorbell protocol
> doesn't survive. Honoring D0L12 literally would mean keeping the
> device in D0, as commit f4dd5174e273 ("net: wwan: iosm: Keep device
> at D0 for s2idle case") did. That was reverted, D3 being the expected
> state.
>
> With this change the modem stays in RUN through 2 and 10 minute
> suspend-to-idle cycles, and its data session keeps working. Platforms
> that do well with the doorbells now use the messages too.

I don't find the commit message particularly clear, as I understand
it, this change effectively ignores d3l2_support and always uses the
host sleep message path, so could you please simplify the commit
message and more directly explain the problem, its impact, why the
d3l2_support distinction is no longer valid, and how this change fixes
it?

Also see below inline comment.

>
> Fixes: be8c936e540f ("net: iosm: power management")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Westen <davidlwesten@gmail.com>
> ---
>
> Notes:
>     This is independent of my S3 series ("net: wwan: iosm: fix S3 resume =
by
>     re-binding the driver around it"), which leaves suspend-to-idle to th=
ese
>     callbacks; it applies with or without it.
>
>     Maciej suggested forcing the D3L2 path for suspend-to-idle earlier an=
d it
>     helped another XMM7360 user with the same CD_READY symptom:
>     https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/work_i=
tems/992#note_2938256
>
>     Tested on an XMM7360 (ThinkPad X1 Carbon 6th gen, BIOS reports D0L12)
>     with 7.2.15 and a debug build that forces the D3L2 path, which is wha=
t
>     this patch does, logging the execution stage and the PCI power state.
>     Starting from a fresh ACPI reset, the doorbells left the modem in
>     CD_READY by the resume callback after 2 minutes of suspend-to-idle.
>     With the host sleep messages it stayed in RUN through four cycles of =
2
>     and 10 minutes, two of them right after a fresh reset, and ping over
>     wwan0 still worked afterwards. The modem and its root port went to
>     D3hot in both cases. This patch itself, backported to 7.2.15 on top o=
f
>     my S3 series, then passed a 2 and a 10 minute suspend-to-idle cycle w=
ith
>     ping working after each, and S3 with my series still works. Built wit=
h
>     W=3D1 on net/main. Not tested on the XMM7560 or on a platform where t=
he
>     doorbells work.
>
>     The investigation and the patch were done with an AI coding assistant
>     (Claude Opus 5.5). It read the driver and the earlier discussion, and
>     added temporary debug logging to record the execution stage, the PCI
>     power state and the messages around suspend and resume. We wrote the
>     change and the changelog together, and I ran the tests.
>
>  drivers/net/wwan/iosm/iosm_ipc_pcie.c | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/net/wwan/iosm/iosm_ipc_pcie.c b/drivers/net/wwan/ios=
m/iosm_ipc_pcie.c
> index 49052eb511ba..dd7cfe3747ef 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_pcie.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
> @@ -406,14 +406,10 @@ static int __maybe_unused ipc_pcie_suspend_cb(struc=
t device *dev)
>
>         ipc_pcie =3D pci_get_drvdata(pdev);
>
> -       switch (ipc_pcie->d3l2_support) {
> -       case IPC_PCIE_D0L12:
> -               ipc_pcie_suspend_s2idle(ipc_pcie);

So ipc_pcie_resume_s2idle function becomes dead code?

> -               break;
> -       case IPC_PCIE_D3L2:
> -               ipc_pcie_suspend(ipc_pcie);
> -               break;
> -       }
> +       /* The PCI core puts the device into D3 whatever the BIOS RTD3 se=
tting
> +        * says, so the modem has to be told with the host sleep message.
> +        */
> +       ipc_pcie_suspend(ipc_pcie);
>
>         return 0;
>  }
> @@ -427,14 +423,7 @@ static int __maybe_unused ipc_pcie_resume_cb(struct =
device *dev)
>
>         ipc_pcie =3D pci_get_drvdata(pdev);
>
> -       switch (ipc_pcie->d3l2_support) {
> -       case IPC_PCIE_D0L12:
> -               ipc_pcie_resume_s2idle(ipc_pcie);
> -               break;
> -       case IPC_PCIE_D3L2:
> -               ipc_pcie_resume(ipc_pcie);
> -               break;
> -       }
> +       ipc_pcie_resume(ipc_pcie);
>
>         return 0;
>  }
> --
> 2.56.0
>
