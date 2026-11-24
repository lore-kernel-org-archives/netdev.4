Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490964;
	b=zyGdXblvc1TmZrs9iVZ7IBmMXkhBLnK0LTTebAoTmP4ScWB/fLxJAoVauot2Q6gYuVOY
	 NA7eVCydd0eGhFSSyT18LsGK7EMGl0MIc5wIy9OCXVqTR3pobH2WHw0nw+GYk407jIbSA
	 5yTv/qmXuCW1FsVS6OW/DxermZ8a5JFhdZRcNjGGPBkqT1VlnfVkogKLRMx/pyotPItyg
	 xDNZUX8upB3BEOJC09qjSHftMj1ZY7QoYp+wHXslQQs0d0AjIgWtQKaWbLM3CSu5fy8/F
	 tuWr4agXY1wStGLTUaz5Ix3UP8JVwtFnbx4uPqon//WfwhIjHCN3QgK1uLWRaS0SJTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T/noZVJlmsVI/iK6NVyPbGiv8j3Ev2OolBCLP6YSdic=;
	b=sjHdbmy7jM6g4HksDPMb4dyaF+KZZizJEy3IUb8P+JY7w71yiuucmwsWIkc9XeNXRF6G
	 vQ0ESwIiRh2++XsopQISfda4cOvEiaLWIgjSeLMBIJsmmYcptCve9RCRjYxx28rUKblOw
	 xxa6n2pBg2YrSIqO9yomCcEgOaWy9elnFW4POg/tE49XVNEW6p7Z6uwLpIl78aXNaEm0m
	 Q1JLFoBG38DgwbJ4WPn6Up5fpN2K/Nw4UeGaXMw/dmUn2yFNzEYujlmrTmGMMJ3G/yujl
	 GcJ+auhoR3pIbHWEHtqqVmIvLqnXs1VWPcMXvciPtQT0+fDhw2qr2TBo1fpqGZwkE0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F7S1iLJc;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25325606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 03:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25325606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F7S1iLJc
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-92134c4592dso37411436d6.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795490963; x=1796095763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T/noZVJlmsVI/iK6NVyPbGiv8j3Ev2OolBCLP6YSdic=;
        b=F7S1iLJcY9sn/pB+Fwgqx3KER9FwyFv78AP1ATJU4Ee05brIci0Fc3l4aG2hFDwTd/
         wVDBNQEmwGJp1isvL3p+Own0Cih/IUGHbyFyQxp82a2hivSqN5HvFNYXsK2stFsZct3U
         +H6ezHSYA7Q0pX8Q2sIJYxSSblK3IwPC8ysD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490963; x=1796095763;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/noZVJlmsVI/iK6NVyPbGiv8j3Ev2OolBCLP6YSdic=;
        b=ZUeLCcNz2tMoncGNYmNbHjHYMnEqOCMVy8Mqs7ZAI3UXhtmUoy0HMEZ3ELWuUHVise
         tNkhBIEfbhZPJ4cY3DBfBbqfQ3AfOWL3PqHhIl0yX96UNEclC5hMPfXQ0V1KFOrikoPl
         NLJvjjVhS7qaiMwkz2B9A7rBPAUHUqGuqwXoFMV3O6Q5OZ0CznEQy89n/E/jH5ta9oxr
         pXTGyzpqKAlu0L5oc2LJNHkxmI3syTRmIn9COx0/bd1ppKwkSgeDQcxyhnk40o9BfBs4
         sEetNi6DXBU9zHsIC93mmCLRWUo6Ie6gnSiUPnlHL+L4foFBngRmOmZZhNMok9vvAlug
         WGLQ==
X-Forwarded-Encrypted: i=1; AL+hErFyASxUNyvgmLJvKW7JH0gvArMy4KdqfI+aTVzjEfQJNPRlqUYwLS8+zoTEhhL9PhNQCUM4ELc=@vger.kernel.org
X-Gm-Message-State: APuU4Z91q/bgSyinQv4/8Yps7aNbuhBpK5OjGFyMseM+Fyd6wKLlzJUq
	r0cmb9w98klhulqFA4JCGmCKfLv6yck77S5pwfPKoSHxi02hEShz7RAF5V7KMxC9D8NjDmWHNBt
	dQrxHhA==
X-Gm-Gg: AZFdTZd5XoQxzKfYAWmViawCMyZ5+vnwkrUl04rEuLoBtXi6wYxtdtcpJwOQaIZYLgC
	oqh2lv2qgKcVNy2HeHPu7KmwVuer8ykXmCkRsLZFHWhhjzt+7x6ZQg8/CePbcHsga97fsRtMA62
	UGpR359oNqj8/EzzTtUQ5saevOaRWKqLgCW/W2nR0zinKqg2VsfE3vEs927+oQIql5KRfjw3rzQ
	KL9UZuITMi3ruydoe/E2mWdR3bccRSC7WUuyuI5sDkxCEk5p6dJeoXcz6gwEi8bCd6hVokN/8/b
	gHAM5FJpfoj0uDb6mh/cLPE5vU5SA5PFQ1yxCeq0oOz9g7uEzWKnHdpPqk8f6Rk6/xec5bguw6V
	efSKTV/egdnIiXu+q6BaIV76VHL53DuklojruqBX3wC2nA8wlty+iGS8LDg+D2m5Ouckh2sGUKx
	izIruI1LZKVNjk+Y3XAfA0ycZu24cHyClgiUWCi8TQc/ng7SVV5V+wrQ3V3oHSOVHuEuCKZ0ZMJ
	qEvp/TBEihsT+yvVc7ebuwpyPiJMkIVdHE+zk0hyJKAl73K2Z8uQF09CzYZb7ydxnTpSPOuZ1Z4
	lJoIF9PuS0Kyne/YX/C51xglrrlvimKBfz18gtdaphU+U7Wsev2X7F86ikn2qYco09wUyIKyhkg
	=
X-Received: by 2002:a05:6214:20a4:b0:921:2b26:a848 with SMTP id 6a1803df08f44-92134a3a0a4mr281608126d6.17.1795490963097;
        Mon, 23 Nov 2026 19:29:23 -0800 (PST)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a0f5d7sm124284006d6.37.2026.11.23.19.29.22
        for <netdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:29:22 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533202fe429so724921cf.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:29:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHlJ3cv4Z6yvx+9xaOI9h7raTMvojsCMEttUNOyUiGFjZUzJdPESD3P8j5yPeX+ZowuZdbN+rc=@vger.kernel.org
X-Received: by 2002:a05:622a:5c13:b0:535:30a:76c7 with SMTP id
 d75a77b69052e-55d88102d7dmr47531361cf.3.1795490961146; Mon, 23 Nov 2026
 19:29:21 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-r8152-pm-notifier-rtnl-v1-1-31e011a2ee51@google.com> <179543717277.3294.8933849621988482320@kernel.org>
In-Reply-To: <179543717277.3294.8933849621988482320@kernel.org>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 24 Nov 2026 11:28:44 +0800
X-Gmail-Original-Message-ID: <CAHc4DN+XYDiiap9B4zp5u8kWYaV=qWvMXTBsHx-fo891MqzG8w@mail.gmail.com>
X-Gm-Features: Aa3M54roZgMs-31Co-jYLCIyN1rqgJ_7jaKMyLPccBs7cNuAnlExCnyWbIF5VTo
Message-ID: <CAHc4DN+XYDiiap9B4zp5u8kWYaV=qWvMXTBsHx-fo891MqzG8w@mail.gmail.com>
Subject: Re: [PATCH net] r8152: do not (un)register the PM notifier under RTNL
To: netdev-bot+sinfo@kernel.org
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, hayeswang <hayeswang@realtek.com>, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:32=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
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

The deadlock was hit during suspend testing on real hardware, on arm64
devices running a 6.12-based kernel. A device was put to sleep
(suspend-to-idle) and a USB-C monitor was then unplugged. The r8152
adapter is on the USB hub that disconnects along with the monitor.
The device could not be woken up in 2 of 10 attempts, and both devices
that were tried showed it.
With the patch applied to that 6.12-based kernel, 50 cycles of the same
sequence on a device that had reproduced the deadlock showed no failures.

Regards,
Hsin-Te
