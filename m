Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794929524;
	b=d07Huc1icjwx4xKNGmN4Q21bZWTw7AxsoJi0c5Mg5TKfza+vBjowVd3baT/y8RtkTjAj
	 fnH1zJIQp+0p08Gbr6SSzVsQHIHOdM5Yn9NFMhR7TF65qN6ZLXtp9+LGSI4OObeaZQRmq
	 kH5sCv5rY+WAr6LnldmHlXjPhNY8ZeQ+JxhjcfFLXy8QLNpAx+DN5olFga5xTKIIjMznV
	 SPLAHTLrcvWl6vJWHDcSESWRoVdAl/c2QtH54AQ9r7VugDo61o0Mr2sihwXa2a/la5CUz
	 +jdJSVQfMd4dtfQzYy07uHetMkK41uK59talzqNlMADR4uQNsPjJ+9ewVz1WTFu6Kuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=;
	b=xdOn98llalO6sXzWvpp6XUHSnd/buvuCvzWsZdLrUCOdUsRCpDFuGDSZj+PsEMPWkeDC
	 dmm35husi2ehwJK5M9vKr2p0LzeWCXumjRhTd2myRfuI00o63WBP1Cixo+11A4lXt1sqh
	 T8fcYK0igx6RbHvTxxWVeyQet2wT9kombp2hYGcFl8AVhm4geYGm7VS3P1WuNxt3EL7tk
	 BOLkvpiMmnP3eCAMmGYrQOnV3YZ2B3yA7dzACAp3LRTwCUwclQQiebJ9os+7gGoutOvtK
	 2YBJHftvKSWDk38tQs+ewKKA0urfobRtCGonhkmjIbgbKEHztE5cnZifjg1lLU16LYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dAzwO2sp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XzMoZm8b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81344606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81344606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dAzwO2sp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XzMoZm8b
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQMXe1141617
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=; b=dAzwO2spMjFA52YP
	lWfm1fMR9YkERhc8Qme5ieeIMcKp8DTbFKHz3g+J/qI9d4lfz9FKE1n5G7LZFAfk
	oeMOa3vGAFr9C7IU7MBa3dnNMI/IjnjNURZByNs6v03+je/pSd9LhyQzrPn68mTh
	oRIjUzuMixpoZZ/WEHhriOKux5nPPCjxGGXHmlkCGFC7Dim4cRaPXHqcx7CZkPm/
	ox+dHFzPKc4bNVncWmkCcruNWtEGvLtJq5esi8U+Rt5ipLgEN6eZ1ZYaebrNwz5o
	JpUTEEMGES6T9LIVpjW3l7XGajRTzhPAQuNmxRpxjtugzbcYICFHS5ih+l7nBqzg
	eMHVMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0s9t047v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:32:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so474609085a.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:32:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794929521; cv=none;
        d=google.com; s=arc-20260327;
        b=RUzKp3K1cMhUFFjq5biFTYVMcClzdUg0wi/KqSLyUzZCR3g59wIxkEl+ZhZ8E2zC2K
         Z4s07T3pKVxlsOJFB1/1zhfDsbBlxEYtVNb1qhUdvYXWzpw2sp8QWqBoeZDaxKmKFaDd
         30BTzr9o5BVSj/OvLVz+fvTkQD9+dje8OPgKcrqtOXqpJxOU50Wr6xdxCS5n3fTOUuDi
         E19nkddvxWqpH40lMQejgWECheojsDndazlNMTMJfohbkh8C40qVN3ZV/wYTwDFxly8i
         l2U+KiLFUoao0lKjmQP4RniDnCIq/UmDa+jmyc4tXmI76aRln+C5vl8YcmZNuvuf9kVV
         Cgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=;
        fh=C1G57/gFnWXLpCiFeh/Qyg/+BC9fkA3mB9PikDr5s/U=;
        b=IzS96d7MhIjz7OppZ1wMUe9wTh49DC7gPz2+fJReHX6uuHaUTd4nqVjmo+Pi2uON4B
         5z+94h1KSUwauqXtrcHSeGdWrmmogi5hlMUSAKg/cwmsiv0SIos5CQYlW2MYS+H3AW4S
         FLK4HYefuRYJj51ktDhUMlxYMFuH4IYy8iwZClZy8fnSbnX1WIh+BPJgkvu1r4TJCiVA
         xzDofUtBm4JhWcoK9GzGD9pFCQYOuIAZ4L+Iqmyve5IcJFrIdeUyL+tsW38r0UAw1T8G
         /tug1O4U4JCZenNMFbPj3gS2BCXkArZNyhtltS4kFMGGRFVtE4IEFqtDU4B1ygM9UIaw
         hldQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794929521; x=1795534321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=;
        b=XzMoZm8bwc99KeKWDbAqZP5FDIZNAkZMO35UvAEE3IusdNg1CWOJPj+MCF7m37atHo
         vFGGuvM2SghCX6A4LSubZ0CYF7KVRgoKj6C/GyslZrepHxOf503VLy861uLKbMxMY1Ff
         8FbGGD+y7Afvx7VBB64Tp9sh2pbaNJ6+bE+fZalGBA6gvapKFXVlBHNMESEpIm2Jfg4a
         mgWyH1oURQ2hvWVHJ7ckcIdpgr9PTCoW5JZLWKa1TIyL1Woqr8tF49n4C3t/CEGJoEMh
         TyKldlKhgetDiRFMJX10eq0tBRhikacoM9yqgCCYjgBeEy/x3L158wJRn85lSd0T8gSd
         ytGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929521; x=1795534321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=;
        b=21wJJnwn0vAGIuIDvjtpeJ23TBAKEaNB6ior9DEFcOtFBzh85/Yf9tNPOpEU13ig4t
         W8RCZ9rzxWhxUsEjxTJoWI7//AhZfgebI1xtfcqtP6nS7jt79kDUpKMNScLJqxZB/6k7
         ZlN/LFLes3ioKWBJd04tyA5/aMatlTwOm+ujxdctiRFQcaJete3gtHXfMI1Ho5fwVUXv
         R+0TK3O5kTL8ZIB18ZbgVMvS+LpztvqD2Vg9522qhssPn9QQfzXBfoD2Hndxc8qPuJ8Q
         oOR3ycCATQ0ZXYyfSJ7lE5tRUP70RnVZAsyytpa07mIngh+hzirXf7kNTtYbro38+p3A
         wMuw==
X-Forwarded-Encrypted: i=1; AL+hErGFjMKqd4aLdo5BY5K+RF6raY217Wjir9mut322sU2watLX+hn3vDfe4XWdtt9Kb2ah3P2Y0p8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H5Lk+Ix5EB4GTS2IxGgroOM0PuUf2UgyZsXSVKRNS7tqHWjhe
	/S2YKLplvzdHJQ2KY3tzRRF3V5yBZ7FrbFD/bdkwqYYxmt5EoT0oDA50TKSdEY+4uqToZETzXwv
	hBjSPEgVdGfhe0xgkjgmPjzDmbrPA/P3U8+fdP+3PiConyCE6c3tKA2I5I7WWruTKoHHVpNGQGD
	Gai9Kpwd24XgS0Rqrp/yCEVvyx5cNuBD8GTw==
X-Gm-Gg: AYBFou3NjMdLJc38HrTAfnuAXp9zgfQPW3JwC6x50f1z0RrQffjxiSEf1EGTUqmum2v
	E3E5vtD0GXxqn6Qw98e3JtHf95IATgiBFECIwWRrY/Nrqw8MU6V2zJeCnheHW8lN8RxtsYg/Xtk
	BaWA9z697K9TOwYVTTqY8U8Ftands+PsSSNnSuaYYpPng6ZBpgMwupkA0pWKD5FpXSLbRl/4mPO
	6rZ2NNC1iQfbOUgEiMeHWOnnyZvwQzqIyAQiWQR1rOqOXxZzkDn5jf3+eIgo7gjZO1H8e3mjFCW
X-Received: by 2002:a05:620a:2548:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949994ae281mr2618285a.2.1794929520968;
        Tue, 17 Nov 2026 07:32:00 -0800 (PST)
X-Received: by 2002:a05:620a:2548:b0:949:7b51:2dc1 with SMTP id
 af79cd13be357-949994ae281mr2612285a.2.1794929520342; Tue, 17 Nov 2026
 07:32:00 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-t9xx_driver_v1-v12-0-e181b616b820@compal.com> <20261117-t9xx_driver_v1-v12-2-e181b616b820@compal.com>
In-Reply-To: <20261117-t9xx_driver_v1-v12-2-e181b616b820@compal.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:31:48 +0100
X-Gm-Features: AclHuK_lDMCUZMYyFfncaim5uPRYhhiPBMrtwbTDrTdo14SKGBiqnZxhh1KjEuo
Message-ID: <CAFEp6-2Ru8=dMA=ra3r+ShvxWoLAa0i-xw0e8vhQ+QxRah3f3Q@mail.gmail.com>
Subject: Re: [PATCH net-next v12 2/6] net: wwan: t9xx: Add control plane
 transaction layer framework
To: jackbb_wu@compal.com
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
        Shi-Wei Yeh <shi-wei.yeh@mediatek.com>,
        Minano Tseng <Minano.tseng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Robert Yu <robert_yu@compal.com>, Jeff Chang <Jeff_Chang@compal.com>,
        Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: P-7p54p_ZNu4EBC8WnevBOurOPHbXR7F
X-Proofpoint-GUID: P-7p54p_ZNu4EBC8WnevBOurOPHbXR7F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfXympCekIWYa6q
 EAkLvI5MMD4KFa0Ra9+Gn5tVWu2b6NJHeO7Qr+g+FV924FIIFJOaj0aup0MQ6N7RFT4VnWpFj40
 xLTVDBOlOn3uY/yhA5JGLkrSMHQvBOSOcbkToUHV0asyjyjC72G5R7IwYymrjbTnZnUCROgTCo4
 gG0WVGStp6lpxQ81+WUCTlFFl3UG38oCt4QxJjBprUoPXUyii71a91x1x2I9vZ31gsLARCByrqB
 kJngjaM9cYLNTFEIZ1aZGOKTwwS9kesjIxxbrIrHL6Ng52eW54Zhi6dV0jSdB1uXRqBOIl7U79b
 ilwIHojXG+8cM/w/tqVNn1/zNDdwblE+HO9RHKcqbCuJTD5PC8vMU9RmO3zkQzOQgMBsql5cBpo
 9wmX1K3LJbBuBMRSosuWEe72j2pW7SHLj/qSn+l1RyLk2/gMa6vx3vdYHem4m+ZfE3kjQVw8AU5
 0xTcISsPFl7SpssxiBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfX8bdxGH1gN2Hl
 uCbMqw38zz/OOAgVxEq4f77wlZhPi38EPFlBmX2UZWeue+e600JAESgHERUnaajtS5ALDIa279o
 UZGF80YLC2R2xDoWpxRoa0c6z7nnKnY=
X-Authority-Analysis: v=2.4 cv=d5xgWhjE c=1 sm=1 tr=0 ts=6afc7372 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=3D83DlupAAAA:8
 a=qgzm9M8pbGeJEq2Y9kQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=LLo2LcjZcqwTTUQ_I4Ao:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170061

On Tue, Nov 17, 2026 at 11:51=E2=80=AFAM Jack Wu via B4 Relay
<devnull+jackbb_wu.compal.com@kernel.org> wrote:
>
> From: Jack Wu <jackbb_wu@compal.com>
>
> Introduce the control plane and transaction layer framework
> for the T9XX WWAN driver. This patch adds the core data
> structures (mtk_ctrl_blk, mtk_ctrl_trans) and initialization
> entry points that subsequent patches build upon.
>
> The control plane block (ctrl_blk) starts out with only the
> device back-pointer and an opaque pointer to the transport
> context; later patches add the port layer and FSM hooks to
> it. The actual DMA engine and TX/RX service
> implementations are added in subsequent patches, and
> mtk_ctrl_init() and mtk_ctrl_exit() get their first callers
> there, in pcie/mtk_trans_ctrl.c.
>
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
>  drivers/net/wwan/t9xx/Makefile              |  1 +
>  drivers/net/wwan/t9xx/mtk_ctrl_plane.c      | 45 +++++++++++++++++++++++=
++++++
>  drivers/net/wwan/t9xx/mtk_ctrl_plane.h      | 21 ++++++++++++++
>  drivers/net/wwan/t9xx/mtk_dev.h             |  3 ++
>  drivers/net/wwan/t9xx/pcie/mtk_pci.c        |  1 +
>  drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h | 19 ++++++++++++
>  6 files changed, 90 insertions(+)
>
> diff --git a/drivers/net/wwan/t9xx/Makefile b/drivers/net/wwan/t9xx/Makef=
ile
> index bd6063c85c2b..0a07507f1ddf 100644
> --- a/drivers/net/wwan/t9xx/Makefile
> +++ b/drivers/net/wwan/t9xx/Makefile
> @@ -6,4 +6,5 @@ ccflags-y +=3D -I$(src)
>  obj-$(CONFIG_MTK_T9XX) +=3D mtk_t9xx.o
>
>  mtk_t9xx-y :=3D \
> +       mtk_ctrl_plane.o \
>         pcie/mtk_pci.o
> diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.c b/drivers/net/wwan/t9=
xx/mtk_ctrl_plane.c
> new file mode 100644
> index 000000000000..18f0573ac653
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#include <linux/device.h>
> +
> +#include "mtk_ctrl_plane.h"
> +
> +/**
> + * mtk_ctrl_init() - Initialize the control plane block.
> + * @mdev: Pointer to the MTK modem device.
> + *
> + * Allocates and initializes the control plane block
> + * associated with @mdev.  Runs once per bind; the allocation is
> + * devres managed and is released at unbind, not by
> + * mtk_ctrl_exit().
> + *
> + * Return: 0 on success, -ENOMEM on allocation failure.
> + */
> +int mtk_ctrl_init(struct mtk_md_dev *mdev)
> +{
> +       struct mtk_ctrl_blk *ctrl_blk;
> +
> +       ctrl_blk =3D devm_kzalloc(mdev->dev, sizeof(*ctrl_blk), GFP_KERNE=
L);
> +       if (!ctrl_blk)
> +               return -ENOMEM;
> +
> +       ctrl_blk->mdev =3D mdev;
> +       mdev->ctrl_blk =3D ctrl_blk;
> +
> +       return 0;
> +}
> +
> +/**
> + * mtk_ctrl_exit() - Clean up the control plane block.
> + * @mdev: Pointer to the MTK modem device.
> + *
> + * Clears the control plane block pointer. The allocation
> + * itself is managed by devres and freed on driver detach.
> + */
> +void mtk_ctrl_exit(struct mtk_md_dev *mdev)
> +{
> +       mdev->ctrl_blk =3D NULL;
> +}
> diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.h b/drivers/net/wwan/t9=
xx/mtk_ctrl_plane.h
> new file mode 100644
> index 000000000000..46f1ab9f0551
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#ifndef __MTK_CTRL_PLANE_H__
> +#define __MTK_CTRL_PLANE_H__
> +
> +#include <linux/skbuff.h>

Is it actually unused here?

> +
> +#include "mtk_dev.h"
> +
> +struct mtk_ctrl_blk {
> +       struct mtk_md_dev *mdev;
> +       void *ctrl_hw_priv;
> +};
> +
> +int mtk_ctrl_init(struct mtk_md_dev *mdev);
> +void mtk_ctrl_exit(struct mtk_md_dev *mdev);
> +
> +#endif /* __MTK_CTRL_PLANE_H__ */
> diff --git a/drivers/net/wwan/t9xx/mtk_dev.h b/drivers/net/wwan/t9xx/mtk_=
dev.h
> index fc25418bb957..ff3cbaa4329e 100644
> --- a/drivers/net/wwan/t9xx/mtk_dev.h
> +++ b/drivers/net/wwan/t9xx/mtk_dev.h
> @@ -28,12 +28,15 @@ enum mtk_dev_evt_d2h {
>         DEV_EVT_D2H_ASYNC_HS_NOTIFY_MD  =3D BIT(6),
>  };
>
> +struct mtk_ctrl_blk;
> +
>  /* mtk_md_dev defines the structure of MTK modem device */
>  struct mtk_md_dev {
>         struct device *dev;
>         void *hw_priv;
>         u32 hw_ver;
>         char dev_str[MTK_DEV_STR_LEN];
> +       struct mtk_ctrl_blk *ctrl_blk;
>  };
>
>  #endif /* __MTK_DEV_H__ */
> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_pci.c b/drivers/net/wwan/t9xx=
/pcie/mtk_pci.c
> index cf59038f0906..3dd8efa374ff 100644
> --- a/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>
>  #include "mtk_dev.h"
> +#include "mtk_trans_ctrl.h"
>  #include "mtk_pci.h"
>  #include "mtk_pci_reg.h"
>
> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h b/drivers/net/ww=
an/t9xx/pcie/mtk_trans_ctrl.h
> new file mode 100644
> index 000000000000..9b42f33bd008
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#ifndef __MTK_TRANS_CTRL_H__
> +#define __MTK_TRANS_CTRL_H__
> +
> +#include <linux/list.h>
> +#include <linux/skbuff.h>
> +#include <linux/types.h>

Same question.

> +
> +#include "mtk_dev.h"
> +
> +struct mtk_ctrl_trans {
> +       struct mtk_md_dev *mdev;
> +};
> +
> +#endif
>
> --
> 2.34.1
>
>
