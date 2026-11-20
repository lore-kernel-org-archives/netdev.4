Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795192177;
	b=RF2WftpL16G1W3CfEJbAQtkC/GOveg20Q5Vyl1KGaCQFwOmv8vt1fg2hmt8l0xjwqZ/g
	 RkbCRgmRyd3/BdvZ9SDS7YrMmaLbk6NhfOAk4RngqiM6jZ1BL2MA4adxZFIo86GRACRMg
	 1qnhdwqt/5G7QaW11kkKePutb+NnoD4tcCX9i86mf+Ehm4CyQ6HNqjsYaGs3TjThqanWE
	 T/cogk11cwERkrIfFREmfyFB0SepefGfQkjW9rKL4O8fbclPcHzvQJpmueMdKgVtJKaGt
	 F1uBcvQVFxM8Nu2vIAVYnC7RYNZOsufVJqksxxOT4QL03ojyTbUVUtvTh3QQ0Z3VR5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=rHeTYVt7epKx8U1QUPkS+orCbcpKVStGZLbPdyQKEk8=;
	b=Tbi2tx1wXTveF075EF3YiXsWMSiPDXM/1J2nHwArdtU886TijxzXY2+u0VyAmCkJHROc
	 lKPr+ZDTCvfqZ/Sheq0TdscIDm0OMj6+qrqPaFYe4N6GYArZmZGBdAoAcaPa+09oQX6ho
	 917D8cKj4I0X7vlVkhFCIfbTNEK24c4RlGy8SV4iF3TjjIOSjXTs19DZ1INy6rr/8fHDG
	 KfHz9EYTmZJVX4yPO7I0pWUnla27qBdzerAU8VRfGZjm6KncteuxiKvzqCo2TNVOiNBmh
	 ahXg+BUEdttBc/d1xyUpFCO2IiWa8pcMxm0h8+xdjBJQ60nou70Vt3JsGJw9q9OBI8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NU/pCwl3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A87E606A338
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A87E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NU/pCwl3
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-77bf892b496so397932137.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:29:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795192175; cv=none;
        d=google.com; s=arc-20260327;
        b=ieis6+XzrknflB4zehKSAkn1BTr/kXzXSjhkK6n/B1EYi4uoeA7J3wKacisQzAnSCv
         GAnnf4/I7mJ1AndSIvNKo+eP/rE0YuMDErpmqBN7hYzxmxdt9xTMieAjm/7d23lKgqWR
         8p8MnzJlnI61YGsykI0g3+D9uiIJy16sW6KngpHlzlverqKGb1tIIXJIanKHJw/NDBHJ
         8dc/2+E44jazy2ktC2I4nf+AVQx1XStv5yjEvRL3HEOzTIWuegLth12DMCGUjaa0jz8S
         Cu2eg3lPlSGH0Xm3qaSkx2UHIRpyXYSCCkcXshDsOE4ue7CiJTwFeYYsYuH+Dn9vfFa4
         2qGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rHeTYVt7epKx8U1QUPkS+orCbcpKVStGZLbPdyQKEk8=;
        fh=3NN9Mr5hX1PI8rmUSb/yWqBytYjI8DwjHxfA8fDyYbU=;
        b=L5ifOkti3Zjd5yW0Qw3k71VhU58np7KCSBELGkzX+ezzunjeTd1dvPrtb8/vHuRs0B
         friLBAwG6nx6tKHgZ6h5muGUKk3TTI1efk2rOqmO0hMqINdGRFWNyO6pCbADRw8TLEfb
         M7WNzN+9cOedxImMWpvOgZUtCCvUKGUX21tOzrAkVJH3PswlUcFilZiSFlqx5qWmmbpV
         JfT5kGLSdXwlE3ddD0dY6vamkss35iS65yAAPefwJofbXaHapKWJfGHDp2hReJl/yUhA
         VYLoJuM9PJ8GWe0atGaf6vJ7vwVKW/ZKZEvnR/N5kAxbW7gx18AusSs5Ly6s4bLvQt7F
         TN2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795192175; x=1795796975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rHeTYVt7epKx8U1QUPkS+orCbcpKVStGZLbPdyQKEk8=;
        b=NU/pCwl3kFiZW+a0XSYkebZeCJmXj/inJYCMHsRm2RH5z514LU+JR5Lfa5xZJKgP/G
         h9U1hoMjddtA1z7rnCbVXNUmtWnZj6wwzSiiBnQcdnBJAWlWGpz1p2yKxonYmuLOxj1M
         ldaKJlvyTPeghpM9f9cR3+STGcBlmfQUvbzlZv68KLOId+lvITq0JPvIfJs70SoROAEw
         ghCgk5IA7xNxWdjGakckclNTsq1KqQieoK+szZbI1mN+sC71IW3vqj80Nok0+E1peG1y
         fulG1V7UZLVvZY/SpLHqw5V53K2+evuKW9WR59Ruxyn2XN35gjwyTnYq4+BhbF9X9ijL
         wBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192175; x=1795796975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHeTYVt7epKx8U1QUPkS+orCbcpKVStGZLbPdyQKEk8=;
        b=gTK374IK9PSaH8556Df5H2c1ie7pkVFfWK/01zh73ysvU2wqSFxIqgSJC2K6b2skAY
         S+dS4hLRsgL5mhxI2zrOHNdcbC9HmcCi1ylHITWpypeCVMVVO3B7JO8VhPYEOXEm76Oc
         VhE/iqH33KpoUFGhBlg30viJoW+VH/N/DFjpaY8MnERF56yxaYrV8TeHgJnXoOX6B2DB
         LWkCkPcXn7N2yzT6kfhHfIvhp/ah0ZnKnml2+e5KCMY3DzgEA0RxeuMOnR5GryaK2xzo
         gDaIDcffPk0a4bLhQAgJcSNLeSTC+1HPwyYHa2pGKubkvGMSWAU6p/aqtnnQ8tcuTvL+
         FxUg==
X-Gm-Message-State: APuU4Z+bfnfQCbO8i52NeB34Wi7IO91Oe/gC2LowhuZ060ItwVxv/vkj
	VQS1462G5NyPmgsOotUamydFenV8rlEvWXTu+bceT+bNXTmUpuBZA+TPjmkQSL7DHzGUAuOwyME
	Tu2t9yGEisEH95d5iWicMo/TxYBOmZHQ=
X-Gm-Gg: AZFdTZd65FtBoOgzDhxm+3J8IUeS26Q1Jpz7bt8gc+8vIAVT2x/nQGoIGR08hWAwGtE
	ahxTdCRLs/QQlQ8b/fyNHAxBPLVqw+YWKzrORXbz2IAsJ4dhXGUTs/tS+zJr06E+3dqM7I3wO9H
	lHk6gzr+HbyOGQmKO2OT5iTNG4yCX82b70mEXeaA6Rd9ihRBugq04qHoVU7Ze2UOKa67zkklCpS
	pk4JMgc0t6tFSHGLMRyijh+K+EU42LNw9xzo5kvRIYC9epQ1zMfLJ6zXiWap2hfaPsTXbMtYw7A
	oyBd7hynsUqRr26XDAvnOcF11w9u6Bhfpmz71BFUuyibOLgBzih4ftDSMbwpBrsnYuTMaYX6BPj
	E03QSsWTxy8qcJIDONnjBkJLsfjutNGUnQpcjptyzL0zB/T9NXJNwMUIGLbHRTZCdAioqDqdJgh
	ZHJH1HP7kfL5wMG3X9p0sJ44kT5kG2MqVR7eTuCF7gVICQA1eX3gmaAFw7MqST4XmS5KEvA+CpT
	PDXFx88eov0kBCcAeWzE0erEV6mMBU=
X-Received: by 2002:a05:6102:c4e:b0:7d2:cddd:935a with SMTP id
 ada2fe7eead31-7d739452145mr1508690137.16.1795192175491; Fri, 20 Nov 2026
 08:29:35 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com> <179518906382.3291.11090310469167736540@kernel.org>
In-Reply-To: <179518906382.3291.11090310469167736540@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 09:29:23 -0700
X-Gm-Features: Aa3M54rxvRHQ1SE3EhRHaS8AS4LHAflcS3ypLersCJii7Z97A0x6odnETYQXmBU
Message-ID: <CADvTj4pcueutmeCv8VZVSEKDZf4F0wekqYE3hhaJf3eWdTR-Dw@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: handle RX checksum and wire
 errors on sun8i
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Ong Boon Leong <boon.leong.ong@intel.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	LABBE Corentin <clabbe.montjoie@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 8:37=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

This series came out of Jakub's review of my earlier dwmac-sun8i
patch [0]. I found the original issue while testing on an Allwinner
H616 with an AC200 PHY: the MAC dropped packets with a bad UDP
checksum even with RX checksum offload disabled. My patch fixed that
case, but Jakub pointed out that a bad transport checksum alone should
not cause the MAC to drop a packet with offload enabled either.

Jakub asked to see the full fix before deciding what to apply [1], so
this series replaces the earlier patch and handles both modes.

[0] https://lore.kernel.org/r/20261119144848.4ddd88cb@kernel.org/
[1] https://lore.kernel.org/r/20261119161151.5251fc86@kernel.org/

>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
