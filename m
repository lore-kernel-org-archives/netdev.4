Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550220;
	b=Y4LCbwodlSv34qZHtirSEJDMBiFqilC7oye7HKootfQ9PjciA8BYSdZ92hF25KbLU0iD
	 29dBHbus8uUcsTk2+kW/CEf57GOeEbbqgYmATZGVLr3FeMzwWaocvyWw+0y40tJdKaB2u
	 N+dkS61LVq+YasXQ9+dCo9K349aFdPYmIMD/aBc02H9KlvsG2agLuUfZu2Efr8iSQa2+n
	 2uXNEm1GAuYbuSYNRGNYPQ+eYijQ7D32cV2Fh6TEkiCbDRm1cHc4p3/IAfxGIJR7jxsq+
	 MNIAImsAfrOR+/8GZgmi/s7p9MVYJVbq1Ug9w22WxmsDGzn6trjk5rJze9XpFAmPwug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=DyLQXoFb5OKmGBBAgGagIw0B2qCSjYuLu1JiC6Z9P4c=;
	b=MBNnrTH2sTxBshJSMcWz/qK8ClEyfdAATntBi9IMupdmtoJJfLAhPkVf2T4kh/Fu6RCB
	 nK6j7+7rF2nHnT6MEkPBdeJddPTHJ186T3OmCda4nbc367LcjFoAEk2AjFYPMM4OmkjCO
	 dTpD6wPKZn5XCZgP3t019n8Nm0R5rxlFZueob59n8vK1x2/o/u4IYCQbXWNOLtf7W6OJg
	 WoTfFfbjqtL0Qt9+SOEHVmL7RaklBtWe2JpULs7ntBDjpSWg8/Pc0A4ccUxH9Lva32xMw
	 fTEhQSxZGX1c7AMBDfhDAWtKsV1ZU6c38WOvaE9Jt1tNpWUpuAHHhfStnloQQZ4wYdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYRT7+Ks;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47113606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47113606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYRT7+Ks
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso2288339a12.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795550219; x=1796155019; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyLQXoFb5OKmGBBAgGagIw0B2qCSjYuLu1JiC6Z9P4c=;
        b=yYRT7+KsTCfMP1Z6JJkiiY+Tx7vt6OOEiM0BE+JrIsU93M3/BVd5Z980hIyg91t11w
         vK0n5iiAigyd4V4XXv2JR0x/tMzGiaK3YowDF0dQ0IDYL43ieUIvjRjLom+Jye6zseH+
         jqftuLxHI0i0IrtzpQmGl/pr3/duH70cZQkyRHM0dWXI4G+hYyLnVL6FtR7xpVkivmu9
         HKHmGGIhLQKUaDLCh35BchU8HHYM0pa1DwM7Zrn3u82IrFH9d8KCxq6UdrguVf9Q9rjz
         TuPi/p7IyoqHNOKL8KomleJEUb1OQ7ZD04UMwFksRkGLQlCrtxeOEyiHVhV9ch1FUyiH
         +kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550219; x=1796155019;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyLQXoFb5OKmGBBAgGagIw0B2qCSjYuLu1JiC6Z9P4c=;
        b=VB8z2KYkuuSfdWxlOPppbuSi5ws3Jjup634i3TmQrxismZF+4VsXMyi8PXRls6M9hW
         ph14pezz1eRXJDjzbr/ajKSqqWAe3M83mYodSYoioJCU8Dlf+lSPm0kTiXBRCYGv3Sjd
         B+Kol9RDEf+UfZuH7DgmY2OhFm/kfRxoO/2SQWUuIF2sPrWiTrF4+IEVomxMfAWjBz8W
         6ewc86iAmtn3wM/j/8wxKw/PXDQRZLrswLHnwBq5TGATATy07sWR4AV4xjdkIljEzAS1
         mSKzlSH2UgrIfdSG/yLeUKDMbuEtiOqNXvIMGm4Gz1pkRlNtz4q0Di2+Fwm2DSKjHrDs
         rgvw==
X-Forwarded-Encrypted: i=1; AL+hErGaqu3/vBZoFExo/nR/GcXkZNyw0zGyNXnzuDrn/vo2SlAmX7UcdBwKG375t648RKOwuBeGExs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/67OvrZ1X1v0bxrHt+sDpmZGfP4FnOaOTQqm6yXdP2VtS2G3oP
	qw97n9P4GzD6QhrNCGstWYyxiGh9pEArF4HyVqnKfETOlHTlzFyGCXkl
X-Gm-Gg: AZFdTZcemLLwBVZH3O3EV0l5RDlPiexDgzPkZksmfIOpWjVdhAsJNXRHK0S3KgB9ZIf
	pkmX4us7864MjJ9vCZhSSLahBGLSVs0exmjij1Md35qE/aFkQcKbnYWSQfNC1I4HiEUAnxMNkVh
	L285cPgn4ccKhYtHKIChBhzWRDyg+wqBX70E4EOBljbTdY9cF+R46sCDeHLmVIyWvZJNBRlCAjh
	xZIheOP2GSo1a1YmrKXgpEn67ankY9w0bMYnrVJb4Y/GopZ+hZ5PkyioSLYfQCg4IdbIkjId/xQ
	kRk0pYg+UPF89rbUegdM45+2Gcnrk8r16h8vy21Mc1n2HK716r2m/7q+7ijNNf3xlX03vFpprIC
	BAzAnjSskqPJVFKGVr0mabQHztk/u5UvyNcTq7sRnIvpSpi1kegqqrZlczCE6VM33JG/RowVQOL
	xtqQj8Oj1vIsq0SrTV98gtSlKF90zghstE13PteUzbiz/jmUTQcGsXTi52O+Je2r0JbnFuDTFyt
	aNjlIqFvkKYPeBO3Lbtsd8bU+50vctvGtgd9lxkji6QPU7ULNKs9m8pNZEeT5DNktZMenL1ublm
	NxaRr8mpd0A4dgZrrdueNgcrXCUvocj7MAD2fBVyiErrtvcLg0VGweJXn8SZrsJTMuBPoC1dQLX
	vS38e7badqbBl6Fx1WhD/1dKslpbeb+0PdgFIOWreTIJgh1X107NIaR0=
X-Received: by 2002:a17:90a:c10e:b0:3b3:d086:9c5d with SMTP id 98e67ed59e1d1-3b41c8dc810mr15654481a91.12.1795550219302;
        Tue, 24 Nov 2026 11:56:59 -0800 (PST)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm23891314a91.8.2026.11.24.11.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:56:58 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 19:56:58 +0000
Message-Id: <DN3PFJ14HKX6.1W8QEBXWGFTHH@gmail.com>
To: "Jamal Hadi Salim" <jhs@mojatatu.com>, <netdev@vger.kernel.org>
Cc: "Jiri Pirko" <jiri@resnulli.us>, "David S . Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Willem de
 Bruijn" <willemb@google.com>, "Simon Horman" <horms@kernel.org>, "Victor
 Nogueira" <victor@mojatatu.com>, "Po Liu" <Po.Liu@nxp.com>,
 <stable@vger.kernel.org>,
 <syzbot+0054fed3dc9085390f51@syzkaller.appspotmail.com>, "shaos"
 <shawnq1@163.com>
Subject: Re: [PATCH net v4 1/3] net/sched: act_gate: bound the cycle time
 and start time arithmetic
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <ACT-WEXM.v4.r0.20261124074514-1@mojatatu.com>
References: <ACT-WEXM.v4.r0.20261124074514@mojatatu.com> <ACT-WEXM.v4.r0.20261124074514-1@mojatatu.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 24, 2026 at 06:12 AM Jamal Hadi Salim <jhs@mojatatu.com> wrote:
> Conditions to recreate the bug:
> CONFIG_NET_ACT_GATE=y, and CAP_NET_ADMIN in the initial user namespace:
> tc_ctl_action() tests netlink_capable(), which checks init_user_ns, so a
> user namespace of its own does not help.  iproute2 parses cycle-time as

Well ...
after "unshare -Urn" an unprivileged user can add a dummy device, clsact
and a matchall filter with this gate action.

That check covers RTM_NEWACTION only.
RTM_NEWTFILTER creates the action too:

  rtnetlink_rcv_msg()            netlink_net_capable(CAP_NET_ADMIN)
    tc_new_tfilter()             no check
      mall_change()
        tcf_exts_validate_ex()
          tcf_action_init()
            tcf_gate_init()

Acked-by: Alexei Starovoitov <ast@kernel.org>
