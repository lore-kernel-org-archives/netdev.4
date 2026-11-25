Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795625914;
	b=n4Ygczu8DkFUZ5gIgRE9jDYsxVwxspvdW+4diK9ifE/Hc8YLKSQB0M+soDhXDiYnFykL
	 I3+QxaSksofzXDpLXJwvRjmfORXqwHAE4ou3DjXLQ+sJnZ4nxf148y2C6HJ+yuSg0WsuJ
	 DPuwREtd/5gLjscrjMUyAuxbkI2F8pv6d2hS5OcjSnngxcxXEaRSRQ8Megz0CjNmIPEMq
	 mQuAdRcZ8893Q2EhvyU/md+i8Lp3pStngKvm3KBm3AVabI3hj6AhCmcdtADBZFRZULigp
	 1muPy6ztKF/qCiXp9vloAkXAkkpzoWOkdnD6Q667IrYLrhQWhxnlJpuNw1Se7qDl3PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ject9iiTwGFjgboQgHdEu7P2MYVEbdMgfvxVSxTr+Qk=;
	b=tf92vaFvZ3uo9pki+ZZGgSvwvkyeeFv3YgdWIXOWunOrZzVGfxHcBZ1fjMVX1rX9VCCC
	 TdfC3hIy7JeW4k+XtzPAGRym523/oOTzpuL7eC6dPas3X7rmZcWepZwU2FYCQHahEr+Jo
	 GgtX1SajKYU7UIImTWlYsScWgB1B4r3nT+BTTPO3OOXAmmNMzF2I/iVSw6SBBHIke8Hfe
	 PbisY/h72FA4ATBIiqf/qAika7N8E0w6sPIq4iPLU7+JqW9u3hlLyEMK8lbg6lD6Osfv4
	 vP5Vr0eotfxEdbHMkRc+X3MnbqMKydTzB+PHc6Qem62zruO5tio3hnZrUpeJBfEVRJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Bk+A/vlS";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB273606A329
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB273606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bk+A/vlS
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6ba4ce91e21so51578a12.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:58:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795625912; cv=none;
        d=google.com; s=arc-20260327;
        b=NLDKhbnMK39p4NppyQ25M9ZmOTlQ28tsMP4YIsrv0erEoEt8Zvj0EjsK0PWUIC/B+A
         xyPQpmYNM3PD77wKEVPveZXqv/MIHm3du+Az6+K5WHiPAOe4j+CPixjbMlsD+s2o58gb
         ElOf8wsw0s2grdxlefEAk0fzkETf0QRcjKk9B/aLcauSjzvoxz/d2rlZddR3QCJoIZGM
         v55y38QrUrbRSk8gOLoumrFVSBNUEXtoGy4/04yoKo6tbF+1oA1LxJ0WbGbOtH035xFl
         kEofWFZBHhtx1bkLjDnFLsiluTwJZlVkkP8M+Tq6xhvxFc0NvxAdci5Db+3ba0CpE9tr
         FA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ject9iiTwGFjgboQgHdEu7P2MYVEbdMgfvxVSxTr+Qk=;
        fh=kIY/8vQiiujVx4ouvROAhM4ji35YL31VpTtUEKol67Q=;
        b=Hqt5/7JPvD8ylnFbCB9ygZzRXXP3nozAS3/lryNAFEfH5xGaFJ9f8qTnx7OaDaB2dC
         HkVwa52JN2uSO1hsNQ9pN/atvl8OUbSLsVDICFtVED2C6CAwGXsbnCYhoVquc7SIJRlO
         P0V9ZnjLTkr+Le58HHMSK1aVsxEwtzoNLRBHVDrQIHmKucqYDvgWHjRQ0viCR9wBeIaY
         971p8NNCyYOf3rozU5vrIFUg1vGcV7VmYOKjLZLGVVPoNYZkEsd+lmnacowbJ/cLJEgL
         beo3mKKqL3jJe1VnCcb8KqpefjtzdE0XQFAhR5rtPz0uxnrusa8dNYYCQ5QQbNqooqkF
         jLSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795625912; x=1796230712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ject9iiTwGFjgboQgHdEu7P2MYVEbdMgfvxVSxTr+Qk=;
        b=Bk+A/vlSq41YM2DUViHIUuRJk72JXv+0yg4eKiDx94A7jhju+Fil2g8gJXnJAfeBRL
         nIldYquXZ3NJZwGwcNkPI1pliq8TwqxkXeYc403LVtu6zXyF36sqssq8c+3qaRiXD13G
         sWLVnnG1Twm9tFew62bgV4FFuP3wzMVghfUgYzB2WPv9O5J0nfS8FJ9JCSB9PlCAfVbp
         449LOClfal/WmI5IeWAn6Dmn2WfpvL2fNprbmrRRTvHSunHBXJjMMwdfkmle4+rCiFUR
         iX3okucItU5EccwXokh4X6bVrqu+ajp6m3bI/FKY41Tc+aVYLiBj8eH+EtL/2XX79GUj
         i3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625912; x=1796230712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ject9iiTwGFjgboQgHdEu7P2MYVEbdMgfvxVSxTr+Qk=;
        b=rRQT9Z/VXq0bOqqziev8ay38DDkib7YxjPwa9ERuMsxcTPNsJvKF/1gO77LZS9oran
         8fFjVUZRdgGv5e/Gl+yVIvqnKKfDOuUQrIDYDQF+AzGEvLYY+riqetUqihop3hgJspFj
         cZygr8Lk/gkX8q8AOsvjooW14QULQ/11ftIdo+jWtmU9rLI+TVKzh+7gfr6nwimDVAvj
         gWCLl9Rhjjv2OTAcIddsVd9GbiHpVO0aoNg/A9O1wa1Gx+rhUqir6Gv4DniJmzzD3LKK
         y9v226lHgSuKEdb2ylqyVuYNR2UJvdxlDO0LQz7B4C/goU8NsWhr1xlbZHLMPr4vmLn1
         TMAA==
X-Gm-Message-State: APuU4Z+o/RLAofOKZ5zexxrMh9uanFwfL5F87OydtA5NCRQwWhYyHNmm
	1k2xksTfvyLy/7iC+SeYNL6U6qCOUmuF2bwsufPp6vNygb+VoBJ7KBHZRJJ0+AEcxrvHXsfhV1W
	Hb623XBg6NV20B87qazA93EsSkmxUV5OocM2n40KB
X-Gm-Gg: AZFdTZfE/zypfJdqSgb1aUzrZEGOxwenqnwjwl6/SR21eFW/YZTAbjW67ef8vCiFS/x
	N3gXNDNyGz631mr8QzIdMNBMICd0kBv/G9FB/Bo172V9Cd8xu4fNMPVlvTKcpxdEvwvZf24AZ0+
	wLcW85+ON46ToyhOiYWUyeNNp6UMuM95Nz4HchDODXD49PW+lwzhYNkAxgb63xOIUVRRaWpXpjG
	td/qv59L7Q+L8h1xsHSK9cZsk5Weqa+K+6ZBwdTlq/DZli9jWGORxx+SpheimcRzIEUU8ajjfFl
	x0YYAANaq7gkbyMFPbZH2CxNgc5Jz/JmtwhLdZ61GM2RQaoby65uEE/KIn2RVBNWiHjiJe7aSFo
	M+dvyEzLbb9mwI3EbhOAf6r99v02ivqr8GL3k
X-Received: by 2002:a05:6402:501d:b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6ba6edb6a8cmr446920a12.15.1795625911695; Wed, 25 Nov 2026
 08:58:31 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120201408.3445445-1-almasrymina@google.com> <willemdebruijn.kernel.18018d6cd8e06@gmail.com>
In-Reply-To: <willemdebruijn.kernel.18018d6cd8e06@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 25 Nov 2026 08:58:20 -0800
X-Gm-Features: Aa3M54pZ8ufNXvOs7t_2pEWv2TAY3aOEqThqMvIHveM4ryFAgj13ob8S5pOGloA
Message-ID: <CAHS8izPs7Up8DQ9=wLVcaEzpcCXbBey=Eij0qOoNz5stm1ywhA@mail.gmail.com>
Subject: Re: [PATCH net-next v6 0/7] net: prevent mixing incompatible memory
 providers in skbs
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Josef Bacik <josef@toxicpanda.com>, Stanislav Fomichev <sdf.kernel@gmail.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 6:38=E2=80=AFAM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> Mina Almasry wrote:
> > Enforce that all fragments in a nonlinear skb come from compatible
> > memory providers (and for devmem, the exact same binding).
>
> Is the following correct. Not an automatic need for respin. Can also be
> addressed in a follow-up.
>
>     IP defragmentation (inet_frag_reasm_finish() in net/ipv4/inet_fragmen=
t.c) is
>     still a gap for the frag_list invariant this series enforces in
>     skb_gro_receive_list() and skb_segment(). Neither ip_frag_queue() nor
>     ipv6_frag_rcv() rejects unreadable skbs, and when skb_try_coalesce(he=
ad, fp,
>     ...) returns false because head and fp come from incompatible provide=
rs (or
>     readable + unreadable), inet_frag_reasm_finish() falls through to its=
 else
>     branch and chains fp onto head->frag_list anyway without propagating
>     fp->unreadable to head->unreadable. If head is readable and fp is unr=
eadable,
>     the resulting reassembled skb has head->unreadable =3D=3D 0 with an u=
nreadable
>     frag_list member, bypassing validate_xmit_unreadable_skb() on forward=
ing.
>     Please clarify whether IP defrag is intentionally left to a follow-up=
 (like
>     head_frag-on-unreadable) or handle/reject unreadable fragments in def=
rag.
>

A quick review says all of the following are true. Unforutanetly there
is a lot of places where we need to check unreadable rejections and
coalescing, etc. I should do those in a follow up though. The series
already grew quite a bit and I dropped head_frag handling as well to a
follow up.

> NB fragments here has two meanings, skb frags and IP fragments. Where
> possible, please use unambiguous wording.

I meant SKB frags, in the future I will make the distniction.

--=20
Thanks,
Mina
