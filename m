Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794870031;
	b=B0FloSLmICWSyBCq8oElSz6mPl2LQ3YF5a+pkdSCZ+hZLzVaBvfyiaLmjOUqqUb1eWml
	 vReGfkDdY5NhRs3dkpg57ECVrUWQuWjLoGKy+kFW8KdIRVX9VLhi0aDA+r+cueBVeP2wm
	 XQqCjx5viEhb8sr+t5UI24FGcE4708o52pHSTa/RjQWL6yhgDVXXO5ww0hCdYfagrXUm9
	 SI4dM/LMkI1PKflZVve7RjNNuaqTkpkrWHPKVy6i1tax7LL4smvFvD6Uf3vaa9hn1V9M3
	 S/GBFkrgANL9aekbQ3DUsRBIXVAGfyrqiO/sD2MJ14Iqu/LCGCwlN1gg+6XouJ3uIpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version;
	bh=BCHVgfl79qsgOh8V2QC+/phw3otd9S0rQogMC77mTS4=;
	b=mpuXs3TwTLoxLkd7NqPPwoK9IGSjTx0mWG1expy50XKNydg7if98QjYyei7JVFyE1zbb
	 tU33HDTgOmGPzjMn3FbGi2goDvxerUam/U5/Fd/jY3knQCq2KKY5aQIVZIIgl2jSHFq7f
	 Wy1n0FwsKXedp+hYFEttsHizZGZ3SoCXsXqTGq2L+in8+OIP0mEIs+ywe37zcr60dkFnH
	 3Iz4cJAxf1Lh2mmn/SpAnIoMzbwHoJY33D5Xvw92p74EjZNjAqEUiPS3Hrc7UdWgblzsG
	 ZFn3ZyKu5Dvgk0cq9TWFhDanmW0+xWEAMZx+iFxbe6ndpfyMuxanNd6eAYUi9ITpX4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bqSqU6yF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550CC606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 550CC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bqSqU6yF
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGM2Adb3121189
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:00:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=BCHVgfl79qs
	gOh8V2QC+/phw3otd9S0rQogMC77mTS4=; b=bqSqU6yF6qU3K0lBCnujplBnoj6
	Qk04NCwjHPY89A0kUMgZtt+BMSnHZZMbjJQjUfXSzYh5Rl2q6WmEZGiohyprZ/uK
	0Kqe7TUQiVFp6yOTrdaSP049p3IvIPaw7y+dJL7qKbHtdYYUSqQmeTFpAB8X+3f+
	ET32GeE3PKZduCdi6ipMtFApojz8LlJYmXdq4PzaYQuCXxVbRdGTC88PNbebbR9S
	b9GjBWYtvzkNTkjsDZ+lSj12/5ZbOh0dwt9I0ENG3loyFGBqOnytPf5rM0td7IZu
	iME6ei8GOC9CAZDOvKPUffcdZVdcE2zIxNWapMTB+2v4zIUjWcdL9vCjSOA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hxp8hp10v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:00:29 -0800 (PST)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b647bbf87aso3017106b3a.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:00:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794870028; cv=none;
        d=google.com; s=arc-20260327;
        b=szSF6Z1EeW6J7BrmEDgGgnASo1QEthpfA2ijFQ/j0UdP7d79eHUKb/wwzM36Ku/6Jo
         5fvGslAq54UKf+SFa5xuNInUdeyZuw2a28YXcbAAvSuzDsK2pp8DIhwSlUbrUlw37fWY
         i9lr5hdm9+A7uE70OcQut88BUScSXINY0y34cufCy+scgqrYmezLz2QqQfige28dtaPf
         DwOLuXNScpLv0evDLlkFyigEzNd1PJjix87nnDKch+ZD0GaMhVv8htSYXmyjt9DPV6sx
         iGzuN90eWkRs3FceT9CEgVy4R7ttHa4Ss/Rrxdep/7gBTsQouYt03T9JN964xUveQZUR
         5gXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=BCHVgfl79qsgOh8V2QC+/phw3otd9S0rQogMC77mTS4=;
        fh=bNo8+ygk5Y33PD0xp5ImIfRd6vdj7mkRSfKEwkgc63Y=;
        b=a5iKXRrx7Pp0Opob78WacyCO4TUfm3vBBq4Ky+9HEUJuu5oKbq5KqvZPfJGHsaMIn1
         uK9QdqeUNQbaxgEdA192S2sBfwaOal2gCWPN+L+HXFArbIhfxmPCA6tLGOnnmgqcAApV
         I+rYtEdCYvRHtPk0VzAWYyfaz6AQRhL60KW9KU5bYBPX/qd4ChbBajRx6PJfqNEjJi4c
         rlv/Xq30uGSJc2Dh67ImuQRx2PT3+onvNYYZ0casKDUf6vt+rxdx3LWzrXEfh20HwKUZ
         4GsfOOjTQq8O5YMOhDU26qzB82TyQ4VeXVwQs4ohjK0OD8o8iPn0KbFW8Jd0z47pmj2F
         6M2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870028; x=1795474828;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BCHVgfl79qsgOh8V2QC+/phw3otd9S0rQogMC77mTS4=;
        b=S6qpKxtA3o8X6KDS20dDePAEijHnrTGentlgrJclWfYVhCcqOndZhfYvBxPuXmbhYx
         fV+TjrSfgwVk2JHGa7amYqQUgaeTmr+/2MSFRrmdPUdq5AWTqVc/zOHIwy7Fakto8Gyd
         yXAS1tL1Ue7RBAy6niKsk9tJHaU6PoXRdzA5X+3JOpkAH/uLSwKAD2u+hDn/2VQEzvdr
         zb8PkhWI8c/XjYtZ/hBKVw+v39u5gbJ0RFLdWlHd235trOKec9FXybGi6XUYeVbZxi5k
         3B3WhpKbX0zAcvNtvrB8glVjgNQ2YiHYCWfwqQMugt2HcHrDVMCOHU422C1+3bK7mTXJ
         YnyA==
X-Gm-Message-State: APuU4Z+cBGQbDJjMBSouJdO6xxMaecu9AkxHsPauMovvf03B0ukaDIlZ
	Rh6KJXxLwsZcgfNsbC+XjgJr6effqfjxla9sE6L6FoHgH7L4loXwvVUSRaoL6tvgzAnrA4/Gl6H
	6NpTfKmev1cz4VSlo1VwXdutT59nEiRBDXzLcqpNriGIYZCrnZ8HOJC4PIvifYFW77DKsBIDYF7
	RZooBWDs6LTpgc0eGF2PVwYTzuosJMzME=
X-Gm-Gg: AYBFou32wD6laHYsnuvVVgv4UuaND3pO1+K4+P+Oh6kYPnPHXrXrdMwODztsVOUCbgt
	iHV17RQL9wWmyeCr3Yb3OyxGUzLCvG2JJ7BR4SB6C4BdMtIsbt6c2dlqNpc+qNnfj12RFX2SqlJ
	+CJx6rkfKQNPSYyhHVh7UBb46glnUSwh/T4d4842UKH4nsZZhEFtM9n24suf71wgZr0L5euFbrJ
	TztUcUHu32GzntJ2Gzc/zw8MTdwCLcj+cG5XNqP9t9hmTSdjdw=
X-Received: by 2002:a05:6a00:2d1e:b0:881:be70:4490 with SMTP id d2e1a72fcca58-8beb6193d24mr11011932b3a.28.1794870028044;
        Mon, 16 Nov 2026 15:00:28 -0800 (PST)
X-Received: by 2002:a05:6a00:2d1e:b0:881:be70:4490 with SMTP id
 d2e1a72fcca58-8beb6193d24mr11011901b3a.28.1794870027525; Mon, 16 Nov 2026
 15:00:27 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111001831.3710881-5-toddfreed@meta.com> <179472727079.2199510.11728930190494845454@kernel.org>
In-Reply-To: <179472727079.2199510.11728930190494845454@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 16 Nov 2026 15:00:15 -0800
X-Gm-Features: AclHuK8U0c5vpo9LrE-LUBEl9Mos_YCScdKBQ9e4Pj3NM_Kna-AkoWmo3RzMn5g
Message-ID: <CADh2yMz==oX8OMx+dqNXort+h4vUFF6LHLWmaZJMTzoW0f+Jvw@mail.gmail.com>
Subject: Re: [PATCH net v5 4/8] ipv4: icmp: don't quote decrypted payload in
 icmp errors
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, borisp@nvidia.com, cratiu@nvidia.com,
        daniel.zahka@gmail.com, dsahern@kernel.org, dtatulea@nvidia.com,
        edumazet@kernel.org, idosch@nvidia.com, kuba@kernel.org,
        john.fastabend@gmail.com, leon@kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, mbloch@nvidia.com, pabeni@redhat.com,
        raeds@nvidia.com, rrameshbabu@nvidia.com, sd@queasysnail.net,
        saeedm@nvidia.com, shuah@kernel.org, horms@kernel.org,
        tariqt@nvidia.com, weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: hrTVtbKMErwayVk1ARbD-ux632DIUyBB
X-Proofpoint-GUID: hrTVtbKMErwayVk1ARbD-ux632DIUyBB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MSBTYWx0ZWRfXxz6PWUc1eMSF
 sH+/MQaXFhR6JyEfTRVbCq08czopuI0f8DfXyAlU5WiSU8wCyYE2FaL552o4HP4+oTYs6msxTFh
 k37OTRrrjOx9mi7yyZ7PsCyoMVsmZIKZ21Ctu6lKVWtifi7FxSZ+CxxHfgv9akinrFF/OjPgDBu
 DErVEvUvaPsiDd8qOtBkFmGCtTfddZ8zw7WBKDjCia97h2UysdHSH4UeXX9Uyrki7Tecki68P9J
 RUngOWaygd7mZ3BK97gzIovWkgY6hJNhnnzisafCPSXzH1BYdDGFoeSiLkPlqm73PoRsy1Hh9AK
 yGAUjoxPA+JgGjV1tMwtSE323kjmEDJHIpV72/pkUd/0EoPasbiExcxY4xU5AWV3uGOI4lfWVzp
 X3xJmWVcwDLuZ2lgFGTaJi6LL5Un4KRq3KOX0JJNW401rGvFtQpk3A//K0lE3VkkzIr/Gji8F8w
 KoXAzZKrP4rHExd6MkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MSBTYWx0ZWRfX0vqepUUI1Lov
 zj4Wd5gVGicogYK4SMIfjRvBUeq2/ZBAX27lrRXnuYO+7lyuRstOroQ+B2izfI/E9VV4MyAGfHM
 P6lxZbgNTni06z+YD8d4xs2YLfJBMs4=
X-Authority-Analysis: v=2.4 cv=J+4/fwnS c=1 sm=1 tr=0 ts=6afb8b0d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=voM4FWlXAAAA:8 a=-ThzyT3jwNi3vWZZJl0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01

> [Severity: High]
> Does this check cover every reject path the commit message names? The
> commit message says:
>
>     a reject rule (iptables REJECT, nft reject) sends its icmp error with
>     icmp_send(), through nf_send_unreach(). so now, a received packet which
>     the device decrypted, and which hits a reject rule in the INPUT or
>     FORWARD chain, is now dropped without a reply, like a drop rule.
>
> That is true for iptables REJECT and for the nft ip and inet families.
> The nft netdev and bridge families are different. They build their own
> ICMP error and never reach __icmp_send():

This is true and I will improve the commit message in v6 to explain
this more clearly.

> Should the check also go into nf_reject_skb_v4_unreach() and
> nf_reject_skb_v6_unreach(), or into their callers?

These paths are covered by the netfilter-next series "netfilter: don't
send decrypted skbs in clear text"

https://patchwork.ozlabs.org/project/netfilter-devel/list/?series=533037

-Todd
