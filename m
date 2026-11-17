Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794887294;
	b=qcPNkMwDwlM+AFucx4EiJNwDvjKORQul3Lg0EF2ZiTiutu9RsZSVEm6fwplZEs9GvlSy
	 kH8Ghfei9r3JwmSaGY/zv+PT6FMdjNWdNm5yWUjOVI07IqHiX1kGWqhRiBioXQYvmn975
	 LqZv4EU0am8dC86Mco7f9wNij2w2Lpvnfsy8OnjJEym4vviAXNtjfjUoZBrmj+1Gh+/2y
	 gDEeV2uvzMtlosl51ZbiWNNhsDiHvh9av9QqQ3Vm5X63rw/7IC/q2p22W/xmJfdb6z/97
	 4WmCZ+z1KdlN12fN0kT7WbX/LuySsNlMfi+0Dki+Q2Dj5JUdiaN7XHOyvmIIItyLXAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DLcMcTvPOEnravF7dNaq+o45VUDBU7Q6BawTdgCmL8M=;
	b=FXRJzGJiKXyB/d/938OXT1Y2ottt8H5M5WVCYKs5n7XYjmc9wmH7MYTKA0/n8ow6/1bq
	 sUe3Tewgmr31FPU9rX8+wqRpUodn6/tHq/DuWchsOI1x1nE49jPNFUCDKyegVraH8blxS
	 UYbiE2fW7bYVxpIEsqKLiFoiVqsbzlMD3R6WMY6HtXWDV1KE05DaRn8OFqLDCidCt4MCu
	 UbwAUNHSAHeJHBrop2ggpdX7HKa1hyScYCBu4OKeNTqvSrmr1EFET8KlyYRRSsTVEbWak
	 +BIaErGop/S2TqzYFIgGeu0bVfZnG2a6WF/pGLZDMt37KY5ks8yIktQtM/LBS+mxSkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4KJSdYv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCE0606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CCE0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4KJSdYv
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b56221d361so6445369a12.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 19:48:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794887292; cv=none;
        d=google.com; s=arc-20260327;
        b=EZ/x8WYxJadv6u+LgNbwds+KsV3IgEQjFZNncz9jHBmOzbffHHcmGe4IC/PAFR/oac
         xRKPu4/Ujg664A0v5mGbG2UNiQCaussR6yEUvqYFrNTCYumPprskaZV8yzrwf7+l/e8V
         8721BIXDnhNIYUi4b5Uro0zGzPTE26Ct/T21DZ9g1QHPNnqYQ+XrBgracVx/h4eJMIoS
         YZSkGFXcgtQ8IIYghmTsDTz448wA37mV2PCf1XnqxilM7I4HieDCmq/7KRsau9mCbwwW
         ss8XCEDxw6lpZ4c4r8V5BqHD07skMIQSEtF8Q3spXE9cUvnMZAptYnTkWtz4OLbg3zQr
         VGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DLcMcTvPOEnravF7dNaq+o45VUDBU7Q6BawTdgCmL8M=;
        fh=wkwWnBV36GiQTSlKla5oJApeQbDOsfFZLu6whc3JNC8=;
        b=YikGxwlpe8ba2oTbsoJgZEiSTFVpk0xtmg0/RvtH84mduwhLQeLNWTnpxLJCZuAckn
         3Ci08m4pZr49sLeqyD9flhMo0Uy6RIddKO0IQW8oYj5Jldy9PuzDbBeE1c/UwxCiBj+F
         3pXwmNtZqmf0FYYKRq1npnvqGgEfhpy6YAbWCHxNnuzqtIAz1exESZOApYK5vVsmtskG
         jAAp5ho3acxOlBGFDsitVOiGdjDAdhrvbxPBNpyyz7ok3Oy/Dl1vm3vauthMfvuj+ggL
         UjtjNCHVkG8LKR+XAZSsH8lMo80vTWIkceCsda74vTi8rn+iGnF1+J6okUwm5BDiW6mn
         0OKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794887292; x=1795492092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DLcMcTvPOEnravF7dNaq+o45VUDBU7Q6BawTdgCmL8M=;
        b=q4KJSdYvaGm9wq4tovsDH2XavwAq0R6m6bkAywHa4lJjiwbn/FI8oLVh/KdujrUgxV
         Cx/D4s15L3ISNRCLBUj2jRzjn6PJw6PkLsj3rHFmpdMvyB1PpFKA39bbycKl4B8JkDFy
         jOPWa6Xn6hmz64pe2p84AVNOzuiO0TyHFgJUPEc7gynks+pF+Mne2ozJ328r3dhhIrNr
         2hZbp+SAD2mF+7m+Nqibej3GpuzulzQvtJBvlvgv7im5rxP9hgOkjTrQB8q+RKOVnrB6
         egNeUTBTJy9uJq93oUiGGFGwdA3a26gt2DWK2ywAyQAWfCytfoWn89F3oxmJpY8vXoK2
         ts+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887292; x=1795492092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLcMcTvPOEnravF7dNaq+o45VUDBU7Q6BawTdgCmL8M=;
        b=X4wVtt+mdqjGJB9VpoNZj+dgkE5t2Yj2jyHCscq3GvYPR1iUzbSBvejuH4BYMc6mao
         FXE3YXUo3/7M39jeWYKIBAVhlLs8z5IaG5M0P4rmuWvsIwwuTXbJXSRihmWlrqkLb3B/
         qa0LP/4Y6Iqpi4ylbUe2HHHUdmdxO7IrkX2p2/pKzzsBrc7gjFi1sl+WdbI585bnc4aj
         Y1dxiGRTh1bpWYStbKYhJYwBvewbtsO2tjx0R5jZ7WHBCpDVJpFLkTMpZKsDT26PABha
         nCkafUQlOXxryGMIxa7xMSYdoje6nFlmun/whHn3xbEjCyxinuTGeo2WI5/5s9ttFLSy
         ghZg==
X-Forwarded-Encrypted: i=1; AL+hErFDACT3Gl7yepUko9BFinUeJ/kYipC3eXYqhiWwa2DqW0Qvr5HW/ALdk0Yz3asVQrAZhTRFLU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Capz9NoL5vEqET2jaQfz1vug2nGYXKHQRxxYwvWtEeEVSTWAj
	hKgqdaQZP1I2Z+WPfqPose/8LxpwboN845eLltGN2PoSs1pCBc+1j+15Zfgi5r2m81q0D967l+S
	khcQ5n3UFOpEh6QbgM00QM/WsYXKNeTMqpvb6FAn5Ug==
X-Gm-Gg: AYBFou0gHArdGz1aPbdfBtk2v8yfIaj0Gx1XjtAZe7dSyRNupFhhHTEUnz4RlbUtu/M
	oYErXHjb+rWEzOlTSj4K0qSBi8PgpuMcLjmnd4/nS2tK0qp54AVOL51/+j9L3KeRfO2qsMUNysB
	9MU8X94yP9zRTTQSBrmqGqk5CSPaGctyK84qPI0T5McbuX3H+/V4Ao5w0qC3hi6GXysiEpKE4pd
	fCpbkX2IARAgsOiT77RmWlSkKsfExuYNgW6aCrjIEYTJ/CqKJ+/OXwaKfW4siwvUN52y0tg45vs
	GwR9CG2JopDa3Ionzw1zeZwkZ+RnTxCvSBkMmDRpLInuU28wAukbbc/BIZpQyxn4d+8/kAQ/fB0
	EQdIFwrpF9CwZBWc0YH+RApq27t/0VxEuW+TPO/LJol/ntNy7vNT92tUkgwci9zPvZ3TYR4FEg+
	wzegPeJLXc93j1Rdw=
X-Received: by 2002:a05:6402:516f:b0:6b7:df0c:18d0 with SMTP id
 4fb4d7f45d1cf-6b7df0c1ccfmr4938103a12.11.1794887292347; Mon, 16 Nov 2026
 19:48:12 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112064624.15245-1-juanagusnicco@gmail.com> <avuhR7Epvtgu--iT@google.com>
In-Reply-To: <avuhR7Epvtgu--iT@google.com>
From: =?UTF-8?Q?Juan_Agust=C3=ADn_Nicco?= <juanagusnicco@gmail.com>
Date: Mon, 16 Nov 2026 22:47:59 -0500
X-Gm-Features: AclHuK_gyo-l2I-E19IhRjvW3CZh8tP53SY2qJsWKfnOF4zx0gzCiSIv7CmIDlA
Message-ID: <CACQ4Acg7wPaOgJ0Xx-ejsBz-k1uyuDPUDWLWs45B_w1b753ETA@mail.gmail.com>
Subject: Re: [PATCH net] tcp_metrics: hash the destination address with SipHash
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:36=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.co=
m> wrote:
>
> On Thu, 12 Nov 2026 01:46:24 -0500, Juan Agustin Niccolini wrote:
> > The tcp_metrics bucket is derived from a fold of the peer address.
> > For IPv4 the fold is ipv4_addr_hash(), which returns the address
> > unchanged. For IPv6 it is ipv6_addr_hash(), which XORs the four
> > 32-bit words of the address. net_hash_mix() is only XORed in after
> > that fold, so two addresses of either family with the same fold share
> > a bucket in every netns.
> >
> > A host owning an IPv6 /64 can thus compute, without knowing
> > net_hash_mix(), addresses that collide with a chosen IPv4 or IPv6 peer:
> >
> >   w3 =3D w2 ^ p0 ^ p1 ^ target    /* p0, p1: prefix, w2: free */
> >
> > A bucket holds six entries and the seventh insert replaces the oldest.
> > An off-path host can fill a peer's bucket with its own entries and
> > later tell whether one was evicted, because tcp_init_metrics() seeds
> > the initial RTO from the cached RTT. This reveals whether that peer,
> > or another address in the same bucket, connected in the meantime.
> > XOR and multiply is not a PRF, so net_hash_mix() can be recovered the
> > same way, after which evictions leak about 14 bits of any client's
> > address, depending on the number of buckets.
> >
> > Hash the address with SipHash and a random key instead, as commit
> > 2ee66e948717 ("inetpeer: randomize RB-tree node comparison using SipHas=
h")
> > did for inet_peer. net_hash_mix() and hash_32() are kept, to separate
> > namespaces and to reduce the result to the table size.
> >
> > Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
> > ---
> > This can be exploited remotely to recover a client's IPv4 address.
> > A single host narrows the address to about 262 thousand candidates,
> > and because each netns keys the hash differently, intersecting buckets
> > extracted from multiple hosts converges quickly into one candidate;
> > 3-5 are enough. The net_hash_mix() value only needs to be extracted
> > once per boot per host.
> >
> > Many common cases facilitate this. For instance, a browser loading
> > one page connects to several hosts within the same second. That
> > supplies the buckets needed to converge, and the shared timing shows
> > they belong to the same client.
> >
> > I reproduced the bug on a QEMU guest running mainline (2a500a04d6f9) an=
d
> > against Ubuntu 24.04 over the internet. With the patch applied, the
> > reproducer no longer finds addresses that share a bucket. The
> > reproducer is available on request.
> >
> > For stable: 5.10 and 5.15 lack siphash_aligned_key_t;
> > "static siphash_key_t tcpm_hash_key __read_mostly __aligned(16);" can
> > be used there.
> >
> > This bug was discovered during an LLM-based code review.
> >
> >  net/ipv4/tcp_metrics.c | 32 +++++++++++++++++++++++++-------
> >  1 file changed, 25 insertions(+), 7 deletions(-)
> >
> > --- a/net/ipv4/tcp_metrics.c
> > +++ b/net/ipv4/tcp_metrics.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/init.h>
> >  #include <linux/tcp.h>
> >  #include <linux/hash.h>
> > +#include <linux/siphash.h>
> >  #include <linux/tcp_metrics.h>
> >  #include <linux/vmalloc.h>
> >
> > @@ -94,6 +95,23 @@
> >
> >  static DEFINE_SPINLOCK(tcp_metrics_lock);
> >  static DEFINE_SEQLOCK(fastopen_seqlock);
> > +
> > +static siphash_aligned_key_t tcpm_hash_key __read_mostly;
> > +
> > +static u32 tcpm_addr_hash(const struct inetpeer_addr *a)
> > +{
> > +     net_get_random_once(&tcpm_hash_key, sizeof(tcpm_hash_key));
> > +
> > +     if (a->family =3D=3D AF_INET)
> > +             return siphash_2u32((__force u32)a->a4.addr, a->a4.vif,
>
> Isn't a->a4.vif always zero ?

Yes. tcp_metrics only builds its keys with inetpeer_set_addr_v4(),
which sets vif to 0. I carried it over from inetpeer's hash, where the
vif can be set.

I will hash the address alone with siphash_1u32() in v2.

Thanks for the review.

pw-bot: cr
