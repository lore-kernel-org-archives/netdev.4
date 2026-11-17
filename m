Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920680;
	b=e63fCU3sgmkMha3hd5IVUk+ojt5F8onWVz2uM/2NFxB+506G67dvRK97DZsQeNm+lhrr
	 PNQAVdnP1f97kbtVWCyDrVmbm4wFkaLFokCZU72uR0mqdg8zHnqbZB5dKvK+vvVWXYMfx
	 hUYmW1UmjP+dcNl06I4WQy9j7tWQtcYbNEX3vIROPF9FkwZisOoWbmCTvbruJ97BWpioW
	 traIdJHq3vaj//+F5FhX9wQkJ2HPbdNc23CX6xZQtZXCBryjZV7hIQhrizxVpxYKxbk1o
	 fhjD8HV04dqEXxQsLRUoZy0qKuKMeHP3mFMajzGCSmMvJ8EANBKHIt0niI+76hSgGeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M7amDaHq46OmFusBtrG1r4booozfmEGG+N9voZpDUdo=;
	b=EwSe1ik1HzEXSzgP3hqNvSntz01pEj/pAAcIfN+r34Vur4H4wUOijyh7ngQNv7rqvszy
	 9AXTJw7ClIYVPkIBZ/9rynhGfcLUXWJqd3WqGUBqnLEgOQjStLIR3PTXTVUcqcdVNDPBV
	 J0FETNXHfNXEQQ4c0vFTkBtHdREeqnmgyOYxt7VjHIHrRThQIYV15vIg6EjR+OiVf2JA8
	 dA4UA1rVpC8qvEBJ4TjYAQ3HQKTPNx3j8Zs4fhk6uvdMZ1j74SxY7sJJwrf4wAnAwj5oC
	 O/LfFGaA1d/e1hxZHxCPGGTlZkordGbkEanUhK4v0scLURu2cqkA6iN1s+YJ9DGu8kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SYkFQOP0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2IfyF8o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4540606A336
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4540606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SYkFQOP0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2IfyF8o
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1KpT686509
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7amDaHq46OmFusBtrG1r4booozfmEGG+N9voZpDUdo=; b=SYkFQOP05yzwfBmQ
	5l84X0HWUxtGj+hF7Gw5J7foY6wyE8XXvtl/YCJLSjRsEnoWLCJRu3B9DxflQr83
	Mrl8GfwE3Et2CMKPTXRknXmSoXtjngcpp7qHLTkn4SE/CM/9BBdbLdUQ4NpRewtf
	xXmf4TYoc44juksX6PMyuRa6SIyqFjVSmk7UFIHv/WAKHzfnd2vFcpyCgZw0IL6k
	JZ06icBis88H4HnsKh0zgFszN/+otSR4iFEcVdYfCwu17GaEHZyJvnkAp0W4GpfH
	heNLnp+6PTtvS2QO8t+rQaiNcvIy0L7l06rpvHRPobW1JR0LD98ef3QGpHZQxBa8
	2WjaEA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rekpqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:04:38 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-862ae90bbdfso3281059a34.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794920678; cv=none;
        d=google.com; s=arc-20260327;
        b=TOhAQregZRUUd1MEUme+JIGy2GGr26xMSf1dcyDybY7sMTGGWxGi0KpJYvkOUBbWnA
         cjNIlL+CEcptcbICLeHv8M0ocnv8zcs5UabWHVG0crhv2E3i07HIPc70FRn+YkR+SdI9
         JKs2oBfdTbnEUeDlSmN/wR1H85ntaelf6bozuZ1oswR+5odiFIWv42PYo1uQVMJTd9Zs
         5eYZWzH7Sn1yodPJBSwIiDQ06l1GtkmNjPg0VrdLBUTDX7pi/wR6QnJm7ux+qkkxiFvA
         ZeqP2Jacgig0KYKXBY7bw+046MU6NHTeFmTz/PQuUsNZoz2d0xcuuNt54U7fUqDAIoPE
         QA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M7amDaHq46OmFusBtrG1r4booozfmEGG+N9voZpDUdo=;
        fh=QxV+0L4jBFqPwdhRjABNSdHrD39pVMFnMbz2fERAmLY=;
        b=sOK/iLxhF96FYOtSYtwu/vQ26sHggc+1sBi7r3jXx3Gus5S5T3+SEkdl9e5ZVrxRPQ
         G9Vhha6yCCWwdlwK8+oiNZBfx9WvIonB0i+BaeLTCAUu/QNjJZh3Kvp4att8QzrlAyh3
         f5YdqQ8ts4Wl1HKmZQNlIB5LXsYRs4GogcY0pUPzRyKtfD3297A3mV+gVI/5hzbmk+nu
         2Af23ztirFAUjQvKvRGfYCvM/ZvjlyEFi5ppiFKzIHcUUJDm3qBB0LRMKdk/yyzMlTgB
         xqVOmQx/Jz55/sPCARWZrutDEdzbTUuZhKORHTYzBqzN4SEtZTO+9dyVkg/qf3BtFhqs
         5lAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920678; x=1795525478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M7amDaHq46OmFusBtrG1r4booozfmEGG+N9voZpDUdo=;
        b=B2IfyF8oesmxSFy/W4GXKkZtW36bptEjob+Qpe1IgoH4ALAs73lh1UTgtrm6yfqz0Q
         bMdJKW2iyo6kHSuY3k04sSu4yUu3hL4/sue/T18E2PVYVMb6KadOf3wJ24oq48EKVRp1
         b1c8g5ZQV8JIItOd10MH/qXR5oTXa+KM3OipDAvJiaYJ8nWjHXkK4yeSlnvs2EjTlxD5
         kOG5vokiuDh+ESn6yITZ5E06kCTBircvEAQZ5GrYfB107sj3+W425JQqr7vYY2npumXx
         3AhFZv/yZFSYqIBSG+ELTxjFiTAEEBdMzzdEV7tYjquh+n7qhl1n7/1cCVUZjI5KpZle
         AfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920678; x=1795525478;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7amDaHq46OmFusBtrG1r4booozfmEGG+N9voZpDUdo=;
        b=YQVTMxgfF2PNHA//WMxGo5UNcXJ1cGOBSgeoUupXut/5hV49tSXYw9gJcR8vryVa4d
         LM8RU3Q2aHKPoBTC3egg3UGQBUkUjuVl/+3qFFffS2nl1lWfpSn1qpmmt9VRLOfYAK2m
         aD92515Oih6dRrGVPpUiV/BlLFzLxsDSc6BHVzgaAIG3B2NmdyJr/bMjWocfpNqjtZr6
         WVtI7hsiYs+oR7KA1IIbWy6GMsuXMU0wSZFyGTpS/9x1iLKwnNp+FSNgNwXOHZ9Vx/FX
         iJOb4rQwesFHyPnxWacOmcUqVtUL97W6BNnmOjZquHhg7nFW98rrnEsv2slj4ruqPNWW
         q1FQ==
X-Forwarded-Encrypted: i=1; AL+hErEEyhMOjI+muLJe+OssYBUQ8/IAAHj3TxlD5GZJDr0ki4npoLgEZaB6xMh9ZmW3wmXUASw1GKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+20IrH/UkVlkljrG10om+DzJBzz/BUNscR9QgYJhOYg1gb6crk
	pgAsoaswrv7jDfUtdZrvZfujj2cJvkTm9P4fmIR9z80DG3G8tbMVIJGbPaIkOyBRJfEK5+PfRFt
	X0Tl8gTlVXq+/aUWZJewIVbrpFYc5uYQJD2zzQpXHs2Gv9bW2TdsmB9athlv0EZqWB28HirvWnc
	xC4Xg+CcdGRvjIi/dvBShDG2UYUlKiqegOkg==
X-Gm-Gg: AYBFou196hHSdW7SIekDj26kGXgSK/BrIu9pU531CnNeKt+GkycqvNbNTEzKrrIZoK6
	nROr28xH61bEfpJD6agnt6UNg8zWMMe+RsN7WEHumDh97XTkCmR17+BIGZqZrii63ifSI8H47Yk
	QAU7sUTfje+4kqZ0H/le9e4xjJy7aYSvXa5XeqGLolDQWFbf1AM3f0/vdsOYJ5v5POoc8Prc9LT
	RZxnfha7QpTcmDwFG1l18t62Q0S4GrQ4J9FSfQp1JgBdNsTv5T5NquyN8GbfEPsdK6dMeRltuXP
X-Received: by 2002:a05:6808:f14:b0:55c:127b:b769 with SMTP id 5614622812f47-56e641d64femr11065182b6e.32.1794920677545;
        Tue, 17 Nov 2026 05:04:37 -0800 (PST)
X-Received: by 2002:a05:6808:f14:b0:55c:127b:b769 with SMTP id
 5614622812f47-56e641d64femr11065153b6e.32.1794920677100; Tue, 17 Nov 2026
 05:04:37 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794905977.git.zwq2226404116@163.com> <dee0cba42234dcc193c59e7847cfe1a8daf6ff3b.1794905977.git.zwq2226404116@163.com>
In-Reply-To: <dee0cba42234dcc193c59e7847cfe1a8daf6ff3b.1794905977.git.zwq2226404116@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:04:25 +0100
X-Gm-Features: AclHuK9K-5DuIleq2c3acuiwkf7IKa5obuGwZtGKAK3ggbCHmu3QWH-ILx8kY-I
Message-ID: <CAFEp6-3VtgV7QLBVjrsHpGRo4MvzZV5KVAYiiZjYJrz9mApHHw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] net: wwan: mhi_wwan_ctrl: add ADB channel support
To: Wanquan Zhong <zwq2226404116@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX5MNTyW4azbWl
 Isgsmi1g9baTasFHsiUX2W/WBYIpeiVhgmg2FNWAeQAPjXp/h52aHWdBQeH91D6RwYfHVQdSRpa
 Uvu1OdZa7slZc4gLSJhwN+3XW7Lymk0=
X-Proofpoint-ORIG-GUID: BM75l4cllEr0fLiySMLdFziJWBhAk5Ie
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfXxMxWqchS/ApU
 qET+P9DUiJ08cdgLiPAbuUw3sGhIQpOHQs8zCNAhqy4oFlvURA4azuCjZc43y8TzJZQkh+csHkW
 Plu+F+vWiy5wxlkMXV0XVLUPmvnYMgV6uhJBt7Fbt4vQLcrRtmDdSrOQJIU3od32yZC9GfE2g5i
 5Nfra6Qh6od4i6EFr3QXKN2Xu5kTjCi66p/fRWQpEsDiuMdQbp2d8CT+rOlB/83VcuOjPSabVmF
 bX0gUB656/+DyxxUL56bmUWzOkaT1tT1srjp2iMP6oMfdG5Tcu2r+trEggCXXtjgqqJDU6zbQXH
 P79BwN7dNpc5KFqlwefhOU4H6bx4IiKtuvMO5G5ZP8FqsA5o/TQYNtzXU7De6lLIqIyRLKalSHN
 lMoFR4skVtrRCcyupxqqRP1U7NYNTl5Ms2r0wdCY5oJaQOwlkIQGl/SWMekgWpxS1asbI0VaDMO
 jRQYLUgVyAHFej2/WCg==
X-Proofpoint-GUID: BM75l4cllEr0fLiySMLdFziJWBhAk5Ie
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc50e6 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=Nxhiib172zSPVyf_-JkA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170051

On Tue, Nov 17, 2026 at 10:14=E2=80=AFAM Wanquan Zhong <zwq2226404116@163.c=
om> wrote:
>
> Bind the MHI "ADB" channel to WWAN_PORT_ADB so userspace can access the
> ADB port through the wwan subsystem.
>
> Signed-off-by: Wanquan Zhong <zwq2226404116@163.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Unchanged from v6 patch 2/2; bundled with v1/v2 historically (Loic).
>
>  drivers/net/wwan/mhi_wwan_ctrl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan=
_ctrl.c
> index a31d8540fbb8..50a3a940357b 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -263,6 +263,7 @@ static const struct mhi_device_id mhi_wwan_ctrl_match=
_table[] =3D {
>         { .chan =3D "DIAG", .driver_data =3D WWAN_PORT_QCDM },
>         { .chan =3D "FIREHOSE", .driver_data =3D WWAN_PORT_FIREHOSE },
>         { .chan =3D "NMEA", .driver_data =3D WWAN_PORT_NMEA },
> +       { .chan =3D "ADB", .driver_data =3D WWAN_PORT_ADB },
>         {},
>  };
>  MODULE_DEVICE_TABLE(mhi, mhi_wwan_ctrl_match_table);
> --
> 2.53.0
>
