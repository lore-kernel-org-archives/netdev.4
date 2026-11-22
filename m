Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795348926;
	b=sIFvWW3mQxL+RmwpmIaBDiEePTKPb4StN9vTimoq3qI8eHd4y8VPMWrxX0pXP3onOBwX
	 EYxk/rubP6D2Y32YV5cRm+0C0wszxm3Fsn4c0wYxvBEYU6JKcgpqJoLCeiNJLoebuNs99
	 rs/LBVoON9vqzxwD7eZJ5te/n4LAJL9aJro6KbcSTVG4CO1hzUFBqh2cXGWYdW5oJGA91
	 UwrC2ZQGhkAfLOw/Q/ffdTfrVpxssSUMsNxE6bg/BWclQtOvADEqvETpnRjhCU43ankJS
	 CmshM5lBNhTKjSlsLkO1ddlto6QDt3EOUCuqiKnnxF67ZGj064s1m3bRAaGf4Zy4R4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=VDAY2l0Py9SC2OiRZKfmkxrUpoDnsAjefW9a1e5gT+g=;
	b=X+wWr2tTB4v0wIzi2RJtRaYbxuwdRgpzSAoh4wkIbDvj8euqHw6W7HZkrPRtIq7BM+Ju
	 fY0rOZBUXtun2Xtq9o4AvrOoH6893skrJGxXWMVDDy1x8SxfpXhjAfCBKyY+IWPTSfKnv
	 wcn4i453DFBfkJG1CV5jF7o+STIwy3K0gu2j3q+c5b8w2+kJWlKPfSKyWZUuXrrbpvDUm
	 rMeALNtcIXQNx2SsaD7G63TUBrrblxEDn1snxBVdbu2wibWypuAfCpALKqZcE9l0VN+CP
	 XMyVDGdKCckrRfrMHgG4kyEt1Op+ReU4NEl6VV4Mus95Q1gdCF9nS8LgKNtWybIBRkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=GSa20sQr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E142F606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 12:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E142F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=GSa20sQr
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b2d14968c9so21409607b3.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 04:02:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795348925; cv=none;
        d=google.com; s=arc-20260327;
        b=HxYYpxSagI7coWvXkC+0J3k3CXLmoEx0bDKYn6cBbdatMuJa7Y/ZuWd14WNMFs9Tww
         l8cj2sSNw2fLYH2jtzRp6fdR7ScPAW/ibsjg3HNTZFBD1YVIJcDcQ5YotDzxwPEqVXxt
         RRC7X+xdwY32GfeNgR51weCWbwfFOiY4Mr2PG4Zm0gLe0JVd7AWV4uEFIklT+RCqOKWW
         B0AsiuXiXk17ePE/2kCGCj0PJMJRtLa3jLB7PlWdW2rl6bkFisVZUHS+Ighf2dSKXapx
         RSyF89/kyMJBh80YvhCLDArSQVSWgDOaYdIDdO7yfKdp4C4UdHxcYNCmAN+lYg1hmBAq
         Tm9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=VDAY2l0Py9SC2OiRZKfmkxrUpoDnsAjefW9a1e5gT+g=;
        fh=zvxX4v+ts354w/BxGZK/DZQqGdw2Mu5WanjW38CrfFc=;
        b=iB6Cse85zm1Sm2goOBXVYLYRjn7nxprMjSsrTFVRDps9kMlmxLLoqGKIwspoNHwQbV
         Q65IPWZPpVmU5F1O5Z2iC24/iyS8oktBCbhLS3sQeIWnWW70477SmUkrAGHwSChm+Fu+
         pXFhusss1jAdLfduUI+LUQEBIazV6zQtSSOVyN3l3nF+xUYRtz56cs/PSMYY/VYuvmB+
         EQ7TBICgbJKT8CrnjwIiCkW6wTEAdfmX0xBMAJfNuCl+Iag5Uu6BoQIqpBdFu8qvawYZ
         E5jER+dn5VDod5CdpQuswLTnTtFA71vmMIPrI3lN7786ua+0vuaFuhzZc+ncVnmBOXFn
         J8lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795348925; x=1795953725; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDAY2l0Py9SC2OiRZKfmkxrUpoDnsAjefW9a1e5gT+g=;
        b=GSa20sQrHDNKTwqo480osbvm+10D+MIqy4bM6L+DapIHb2+q32BNJpyla/6tGUYXG7
         +LJhhd0SpTrDDH2g/XM8D1aHXxHPaaAkoPTyPApDq9UflQdqV7zoj0XLGRdw6ncSem79
         tcdx1fdOemsgY7A/iop/NZJHRVtlp/ZupsaqrTTIvwsBH0e3enpDWIwatPwA/uFEneZh
         2OCB8R9fL0TFOLbZDOciy33FJaka1jNWVeowsQq4eJfVNS1vJbqdJ/lbjELoUczjcDX5
         dNcR/NUkb+CLyr3k1Dr3lwiPEk6LpTTu3xV5UgDiMV2Wftlu1+gIYmfwIcGcFd/U9D8O
         Ahng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795348925; x=1795953725;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VDAY2l0Py9SC2OiRZKfmkxrUpoDnsAjefW9a1e5gT+g=;
        b=nnn6SdPRV05HFgdZyrN0SWS6iNCF5v0PJljbxihtFTtSsAG1LFAERrAK6JEvs/00kf
         oFmF+lJ5MqjslFlvUsK+d+5igXG69rofPjrb28zqQJEXxAVY46aBfiLwPw5RFFp3Nn/1
         zmUTjUP39NHXUCaevI8wM4BjciEa5tY7WT1Z2zT3b5MSTFaQ/5NHIuTQi+twZZWvfqjY
         eRtfl30Z6Ia7pkdD+4kT6DEvOnSZ6PdtKk36anLj+8vdVbz0ZO5QQoIt+Iatc0JRZAe/
         C7om1cF92zzsw7cQLXBHz7dr+wmFLwzkk0N/VxJbE36AtIf1qu5ST1APYATjo0rlXzd1
         ldEg==
X-Forwarded-Encrypted: i=1; AL+hErHdswHoq4yYOolHdDTR2EqWATu6IOaQXUVr225tuQvQmC4WNNHIq/wKKE6pUgU8E7FOBeSWP8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lgTf7tEwyP9hFXVXCHgEFMwgtQ92rYpdsVh9TxqpbLUGs+FUs
	ZW+r7F5PX6l6WqIfH5ticVGjSOmLW37T0vU9l2McLtJv/orsV+8eMSk3vZUy+6jXwU89O7fiK8n
	Meb8KyhObxubOlCeR/4nfaUhDAT8kXc+KkRSVlRYj
X-Gm-Gg: AZFdTZcF4x44IcSkxlqvJVfp6slvASqeSnv/9LtJJ8dElAdk7DsnYcw52rjfqxK84aE
	JGQqcbcPUKb+9+EH/RPBjIzZwua3yZidkdhqpvnmg/oahgml7gs8M/AEhwwzRZwpO5XvaT3No5E
	kA04Iy68elEufTspVwrPhyAR4EetSJ+CJ9teyGTLRDGtWe4dT8Emm3OQ/YYE7lnp0c9dOZZ3J2f
	fOe1EpWXjDdOYHhz0Mm7mm/8RcRqsuqmnK+YB4IfwYyQvMBXeq8gxg6tPI+lPKaq34yHmpnjz+M
	1F1EzV1OOX4pdahuck6+CbPIDuyZtD3isHufBk6r9YPDvCvmDtWS6J6iogELUnycAyaNrpxUs3A
	eo89bHD06z7AIrAZRMhq2MGPeKuWD4Q+FDwex/TzdbVvKJ4O2eL6OP3CKUJLcryXNuizPOEyVoz
	43fdRii2k4HJj0Hqv4oDI5VFEMRBIboLctIFVDjdDQqkjprIiVU4I6TR9VUFNpb6q1TkWzNgwkB
	l72TW58sGx3GdrdtHcQIWbDqczUj3I6ZejUjikStaLOkCPAmtkna93uerYRm1EjkOihlWpLntkp
	NYs9aaMPg6oY+/3n6N0XIznq9bPrWpbvbClrZvJ2ixilXYlDkGBxXQWI4Kd5zjg8bmwCGRDWAWa
	MCflp78M/w/gFCHYKoftWIN+QKTjzeeVeGOBl3//KHhkHCEBANjI=
X-Received: by 2002:a05:690c:88d:b0:8b0:d646:95ae with SMTP id
 00721157ae682-8b520436e42mr29583277b3.18.1795348924716; Sun, 22 Nov 2026
 04:02:04 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sun, 22 Nov 2026 12:01:29 +0000
X-Gm-Features: Aa3M54pGP5Y5GelDYyIRXPac7qaJVRqnpPRHmYC1fODXTa_3sxZD5zd8Qe6ua_w
Message-ID: <CAC1t37+WBG97C5ZeimO9SXAKChk0BU1kRC5E6yKAaOHXvWDpMg@mail.gmail.com>
Subject: Re: [PATCH nf-next v11 2/3] netfilter: flowtable: tear down direct
 xmit flows when the fdb entry moves
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, Florian Westphal <fw@strlen.de>, 
	Phil Sutter <phil@nwl.cc>, Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Eric Woudstra <ericwouds@gmail.com>, netdev@vger.kernel.org, 
	bridge@lists.linux.dev, coreteam@netfilter.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 21, 2026 at 10:10:15PM +0100, Pablo Neira Ayuso wrote:
> > +struct flow_offload_br_outer {
> > + u16 vid;
> > + u8 present:1,
> > + link_vlans:2,
> > + link_untag:1,
> > + link_8021ad:1,
> > + inner_tag:1;
> > +};
>
> What scenario are you trying to support with this?

A vlan device of one bridge as port of another: br1.100 is a port of
br0, which has the router address, and the host moves from rr0, a port
of br1, to rr2, a port of br0. nf-next offloads the flow to rr0. After
the move only br0's entry changes; br1's still points to rr0 until it
ages out, so the gc must also look the host up in br0, through br1.100.
That is the "stackout" case of 3/3, which stalls on nf-next.

And thanks for the review! Can I send out the other patches to get
some sashiko reviews, or do you want to keep the rule of 1 patch at a
time?

Julius
