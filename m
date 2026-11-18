Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045664;
	b=IUFCgWpEHUlgy7nwppdN0PE4uCLlM7Z0NJRJuIaVugnWA1Cdjme/JQJI3nybxzjSINrs
	 imPtR/jWjkth43zszOwfpzhgoJwps7vzaqvvZbbl0iL7magMaALU/Cwv6tNKQ1dpyIoIU
	 BzM7UsIzWA56bFPV/pSJRMb2S6vNw7SxojeKuury7UJfd84/OwqtWoBu99IEVoOepyft4
	 39hMe4Ztms3m1F3wr3e5JD5ZaigXM39XDAIWfWviuwhDiFkGl4LLjBYvfmkKPv0z+U2Qm
	 YnOAwIZGWs6kteJamSIc3J7b3qGiBWdH6qMVec0qGUE9ddihO4NzAcUlrQ5xZMWIZvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fOtrtRrRBYccMRRqskeR467klcSZmgo7duG//MT32zE=;
	b=Rt5PesSyhVa786pdxPYMKo0FVUB8VTg/QsR75i1PEra//0D+1rpIItxNrhweDRFcSJmX
	 iu/m7UKgDtkRb7ovV4sOoykv4oWrjQd4fdj4CokWEUf07quBkdiNwrefk3bFFJogPCEbR
	 vMg5/TFuTuve7kyP+nwSeGtaVZUgWokARe8myHICx0jXvuDmBzJxeGBtS9yPHU/xgG5oY
	 Fl48Stj0PT8hX6Wczqe62J630g/2ORcxHkc8kpZPvXLOzAimzZ+PMM6FeVi8PDVj4aBCi
	 Rz1pKQiyI9RdedL67I6IvOJG80xY5KAEgDAd19KtEuyZSGcsdx805uPV6DAbYj53tNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGYPtjKM;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FCB606A32F
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7FCB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGYPtjKM
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55c38cdd5b7so20104351cf.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045662; x=1795650462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fOtrtRrRBYccMRRqskeR467klcSZmgo7duG//MT32zE=;
        b=OGYPtjKMKTl7wF1fYdY5ieaJikCyZBWWlUDqNV7GjCxnxKnBo3e5Oqv9iqUBB6cO1G
         TlSQ1su48v6kVxu8W4Udbb2h8XnwBfrZp3C9gV2xbZ1O0RSTp9sjdX1z93z6K4J82K5v
         tMTSQ9ag4esJGs/tT8Ok26M2m+bVqOAgrjLuGB6HUPAD0bGxgt8a3b3M2dVf2jsi9ilo
         XB1BON1K3pAdt9QnCiVGBJEhhY93BG3ebgsAu1inVJUXlrojCsrZ/lp8Z9aSKEVKsVTy
         a69EFd0WRqLLTFzZJkrwKvrW4LgAbF/LsCrGNahdJwYZj1I+oBatFFW/HJxgQAwNzGKN
         9bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045662; x=1795650462;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fOtrtRrRBYccMRRqskeR467klcSZmgo7duG//MT32zE=;
        b=Bi+Kgn8OtbTfpkuYr07gjxkDPp2Ff6QqJk07uNp9gAGiRI/q55C1+yVsTAjRFTXYkr
         sPal640azxHIMsgZBoX3TgyN6qIv2z9h4U/dgDqKwmOGw4oFB84tDsc30NjcaNl+RG52
         6LdlvqNwmOUoISlVCe62ArDcRvyjSadjge49RAimAxPw3whR2+DKbnH7WVCaNzzKFAHy
         NPsJ2Gx1bnMdH+zrMY0HP41yvhb4w+1O7arRjqu0XpBzMoL4Tx4WP2xJpqdtSX5XEd7L
         GRGODPs3hHGrNljjhX3G4dd/PmWyz+Y72pK1MGg1h8ZW+1q241YAoHpJyAs7sOLLqBp2
         y+Sg==
X-Forwarded-Encrypted: i=1; AL+hErEzbIX4d+A79uO0iyUTvZnGNLW7sby8hAHW/fVyWuUwossN6dMTF/OoL1nJ7m8CmNkGbqn+e3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9nJzpb/ejjycIyJBw7H9VTlgnaHQF63A8lC+9n780IIK1bM55
	P55QnSBMO54JgnimVQ8nIAMotrLAiBOeQCr4/eqaqRn5ur+qGN7DZW8G
X-Gm-Gg: AYBFou0Xx3BsGjezeL6HtfhrLmke8PAN37rdXNIXYC47ia2o7Q7P9W2T4INKI/Ih6D/
	Vvl5W+hRjTekwIIuHQs0t8+44ERrfd5H8dK58XgJJ95O0B1USFZKACduLSQpSLd2ryHY7mcSR7P
	r5rZEldIP/4XZaZtLPWce4nwmh5IdVSJYP+U+O32nJBNBz4PAFm8zZzCE+KF41wtMHC08VPNys/
	qmq/YDD5b1Coivknt4jP2UbIZ++sXYUt88vm3I3ObMnGNa2vL0Y6HtGkmZsVb8cbQ5Pdzerr3eY
	jPob4sMKpB1sboCa7EtZgOr5Ds4AgO3xjD2iZfNCPTrlKEY1ztpqMyttwYFV5a6NTYiXWB5KCFB
	Y0Me8CMvLO0yNwaZGJONOqemM14ws7BVqQ6h1UkUfCukwBy5kRrUZ5bo9Avd4oO9tbbiVKWsjc8
	2eFeELhAG3/HiqFJyC2Dn/CMk63U0OdIYFogORzsv07s1mAyD0AzJnqzavztih+wOOZ4z6HBK0q
	41EK0TuyX6fFpf7hKgdaw0XYui+j7gfRl8QLcdAvMwX6bgG9/gVEv6ftj57opYMT/xIv3o2H9Ni
	vkEYPQIYiHbwndA8JdYiIQxj7HMSyyP+3OGVGScf3dYhE31KLYUDBiIH0f+GScns6Rf39ArkKD4
	fglTFWpv1Aaox6CbuRUF7tyO8FPuh5kFWEq11ASNWN6YrZM6iol77HJCcClUuUlE=
X-Received: by 2002:a05:622a:248f:b0:538:684:448b with SMTP id d75a77b69052e-55d5a6b1685mr65405491cf.60.1795045662580;
        Wed, 18 Nov 2026 15:47:42 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c4a4e9sm11034551cf.25.2026.11.18.15.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:47:42 -0800 (PST)
Date: Wed, 18 Nov 2026 18:47:41 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>, 
 netdev@vger.kernel.org, 
 edumazet@kernel.org, 
 Henry Martin <bsdhenrymartin@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Message-ID: <willemdebruijn.kernel.2a3141d1dd915@gmail.com>
In-Reply-To: <20261118125443.1137177-1-edumazet@kernel.org>
References: <20261118125443.1137177-1-edumazet@kernel.org>
Subject: Re: [PATCH net] tun: flush uc and mc addresses in TUNSETLINK
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Eric Dumazet wrote:
> TUNSETLINK changes dev->type and dev->addr_len, but leaves
> dev->uc and dev->mc untouched.
> 
> Entries added with the old addr_len stay in lists and rb-trees
> that are now searched and dumped with the new addr_len.
> 
> When addr_len grows (eg ARPHRD_NONE -> ARPHRD_IP6GRE), dumps like
> /proc/net/dev_mcast and RTM_GETMULTICAST expose bytes of
> netdev_hw_addr that were never initialized.
> 
> bonding and team already call dev_uc_flush() and dev_mc_flush()
> between NETDEV_PRE_TYPE_CHANGE and the type change. Do the same
> in tun, but only when addr_len changes: if it does not, existing
> entries are still valid and there is no reason to drop them.
> 
> Fixes: cca8ea3b05c9 ("net: tun: set tun->dev->addr_len during TUNSETLINK processing")
> Link: https://lore.kernel.org/netdev/20261116024056.1274402-1-bsdhenrymartin@gmail.com/
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>
