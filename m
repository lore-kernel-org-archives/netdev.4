Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101349;
	b=4e9KMoMDcY9q0YYWgFDhtxWhxbqRJ6GHtzLUGEzjqYUu8J9B+695pAW0L3JFWkH/M19/
	 wu91w7Y8aLnlq3g6LPaTn9yqomZUD3h+uGiXUmXBa5xDOy8mu8irEJaKmReYGdhy0l1zv
	 48Tcv8WTSyKIYiOcDpoL1NlshK/JwWNeZXvZ2o1HRv6hfxdhlAJ/ZZntcg+FMGM+3+QII
	 l4CecXoXmGPXVQ1Cw1dTwi4RdgPKi9Xm3ztxbLZMDNMHHUfm9OgKLcOj7ylz7GnscajJR
	 lOHMaAv2rfCwpLJP6GSZhfMeWwLfjRAoeFrffQviuJvf2UJW1bls1pExVNlqN86P52g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=sfRXfpwklxyZ5gL7H6Wr6erdOMTsldmz8uHnE+HhzjU=;
	b=veoP0Bsk3XFH/GULQjQsudX/6987OWZVoJ74i9SSElIP6zlOH6kbvzhyYnn57TqbR5z/
	 vb+fcNya/sKXpFSxIy9Xb7/rawGfsqEyF8+r4ETsACI0m9DqzLBe52l1EUTMRQAOp1N0V
	 PE1OJQtJlp5h/UB3E9bRS+zsaYPpqnTyDWg6nEpOgSZgO4FO1FNBwN3Z+WSbNwNDMQURr
	 tmHnOnoTYZcaP116+6E7pkqftcxc25BvkAi1wl/lht1nxZ8EUJEBA9VitLpHgp88Nc5hW
	 3QXsQVBnRpxjALvSZ44M2kB4LQwmLc41d6tGxEvFe1sc+AiPnKSOS3emaJnJBZ53Yng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Cn1zv9Tm;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4206560A261E
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 15:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4206560A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Cn1zv9Tm
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b413997581so313503a91.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795101348; x=1795706148; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfRXfpwklxyZ5gL7H6Wr6erdOMTsldmz8uHnE+HhzjU=;
        b=Cn1zv9TmpCnPcaSMcd/LlZgTh76BuiBetRGpPw4ZV8qdrxc+89KVdZroUqswQ74uu/
         jbVIzeu5x5Pf/HguOz9ii+tt213ksPN8O6XkHdlNc9cQSQh5w448cNxvhLx9SSIeFJKd
         gJ71ezVnE6lPgRiDqXYG+dm0w2shCa7CEY2V3IV3bEGVEYjDOm3b6eGEcQbMV26lWGip
         M4ezJDrkqxzZ76eFtny3EWmTzCQ5pK8KaE8rS43hWuvNUY7NWA0kubSGsZxChnGCDH9Q
         tvsXTGfYjOysEo7OS7io+/hBZh6mT7rR/QMPR34hMM2W1OCn6XxaNSK3WqJbaLibRIuA
         RPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101348; x=1795706148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sfRXfpwklxyZ5gL7H6Wr6erdOMTsldmz8uHnE+HhzjU=;
        b=ZA7AzHS0+bj9e7kh8Rh9snvYFi6TP8I7Jg4ZnQbAafi1/WbkY/DavkrQRK27DNlwuC
         505cHXj51wlK1OwvgyBGlBop9BisWGxXSaGNR12gLcsuuOKP0i38Hj4pCCkwvgGEwDGf
         vQ4kLCMOgJD8kZMKAF+eN8/Gwyf05xcQFdwrWdWX/JHtj2p5jET8ky6iwocXaRqTfJ8P
         sZjTI/fLFohIUuXfoq+tNcyKFN6iuI9bFWi7XRVzbxi5uCvjpbYkzMNPzFFNXlS/2epu
         vRRyAi/mHW2KrVUia/F+Vij8soWwsY4LVoGd4yu3cmhurvfDts+PwOqHmjeBNsBQIeGw
         H5Bw==
X-Forwarded-Encrypted: i=1; AL+hErFfSPSY1oI4SIsXQacIeaN5rq096eOO0HPZeCZwUEKGC/lbhG1vHnGN9xaTnaGjpvsJ0k2rcnc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aY8iWrEp8CKca/b8BrjDbXlLC/EON9fbwlr1Uff6f8aNPiUvm
	COd49SZbOxApNRHtauf4SELqwgRIo/c2NyzVLLPoWamYYoD/kl8N9tU0YughuXEAsoo=
X-Gm-Gg: AZFdTZec7A9/7Cr7WULZg/7cABq1kHLKKU47mCKQxdFm5u8zU80DoixR6eRvH38BYs0
	+mb1se5e5XeTlNNf0x0cFJytOcaNtj1IY24GK+/ufWXbyJVDZVh0IcBhz0sVkluD+/iGwRV73X4
	TqGHwoOXjyWp5RJYJM37GuM7LyFseUhzf4MnnTwIU3mFCWiMiykLQBCAx8Ab13cjZyO9qDO6+kz
	zDK5md9iR2FE/2XNkkvNHca+jZsPyC4qSb4jd4IreK6pnfckVYbF0XLhf3YRsz4otnS2r8gfmfN
	GF/QSOtjnWNRz7tIQk84Sq77KeQJi6zDu+hYqXPL0lZcLghFkc2FGBOY68kE9n8O6rkt/O3H9J1
	RiM0ru7aS3+54wD3PrvMwajNDQq/249XjwZzt1/G17Ik4ZpsFomaAQklY6gvY2IbBLtZ9+rlftj
	6m8k/OmbpGOROFdRla8cjo6PB2a4Hs2jkB2ICStnmiJ+ThRN9KJv9BHKgL6Gf5iCLPNisBLl301
	7pD6+pxNc72oThtkBWdfWcR5SZtQxdpoS0UKeZJJLKE1WQkttscy2HJX7WKg2nG67pU2snHKrQd
	+kxx9ODxAyc7E3wLrISaFnd5pm1SvMXUaTnKqWrO4NI=
X-Received: by 2002:a17:90b:4c8a:b0:3ac:7c52:fb04 with SMTP id 98e67ed59e1d1-3b3d07d80admr6102377a91.44.1795101348515;
        Thu, 19 Nov 2026 07:15:48 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:73::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40285cf3fsm1869921a91.4.2026.11.19.07.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:15:47 -0800 (PST)
Date: Thu, 19 Nov 2026 07:15:46 -0800
From: Joe Damato <joe@dama.to>
To: Michael Chan <michael.chan@broadcom.com>
Cc: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, pavan.chebbi@broadcom.com,
	linux-kernel@vger.kernel.org,
	Selvin Xavier <selvin.xavier@broadcom.com>
Subject: Re: [PATCH net v5 0/4] bnxt_en: Make RING FREE more robust
Message-ID: <av8Soqh/haOS3/JL@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Michael Chan <michael.chan@broadcom.com>,
	Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, pavan.chebbi@broadcom.com,
	linux-kernel@vger.kernel.org,
	Selvin Xavier <selvin.xavier@broadcom.com>
References: <20261106191423.4194081-1-joe@dama.to>
 <avIpEpoCYvLHYl3j@devvm20253.cco0.facebook.com>
 <CACKFLinPK+wR=TMA3zNJDKQR_=HfMFUHPxKS+yhvv9SegZw7Ow@mail.gmail.com>
 <avNWzavrxJSasfp5@devvm20253.cco0.facebook.com>
 <CACKFLikU8ax8-VN+EiAhrn_w+2=yex2TNHPxEYqni6g0BKHKKQ@mail.gmail.com>
 <avOXJf5yl8ajf8Qr@devvm20253.cco0.facebook.com>
 <CACKFLinsQdoZhEnhmZmMEMZVyGC10KZZRciBGLzA12W2iOK60Q@mail.gmail.com>
 <CAH-L+nOyNgAUMCF74OE+oU2gSCaV_tVcgm2QQFvjge10A+qAYg@mail.gmail.com>
 <avx8da+htUim/x9i@devvm20253.cco0.facebook.com>
 <CACKFLimpUYgcV8VW_wFN5Bm+4cb-4eE=LGtp+9QO5dxAShBgCg@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACKFLimpUYgcV8VW_wFN5Bm+4cb-4eE=LGtp+9QO5dxAShBgCg@mail.gmail.com>

On Tue, Nov 17, 2026 at 03:04:09PM -0800, Michael Chan wrote:
> On Tue, Nov 17, 2026 at 8:10 AM Joe Damato <joe@dama.to> wrote:
> > One more question before I put together v6.
> >
> > bnxt_reset() is also called for the silent reset on a VF: the
> > VF_CFG_CHANGE async event sets BNXT_RESET_TASK_SILENT_SP_EVENT, and
> > bnxt_sp_task() calls bnxt_reset(bp, true). With the ULP patch as planned,
> > RoCE on the VF would be stopped and restarted every time the PF changes
> > that VF's config.
> >
> > Not sure how often config changes happen with RoCE in use on VFs? If not
> > often, then treating silent and non-silent resets the same should be OK.
> > The cost is a brief RoCE restart on the VF for every config change.
> >
> 
> VF_CFG_CHANGE is to notify the VF about changes such as default VLAN.
> Unlike a TX timeout, this is a normal config change and I think we
> shouldn't disrupt RoCE unnecessarily.  It's unlikely to run into
> errors during the config change.  Selvin and Kalesh, please comment as
> well.  Thanks.

I didn't hear back from Selvin of Kalesh, but I think we discussed enough in
this thread that I can put together a reasonable v6 that (I hope) will be
acceptable.
