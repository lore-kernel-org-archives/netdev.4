Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795585875;
	b=rgX0ZgyFWZAkgMi5GHWgLGOdVQyonAmYHn+tbaOsgDtNdOvR/XLdNIAQFdtRpFj7Y8Lp
	 zFZiQbTd9Z9WnJYPx+wk610sqBEQtsnMjVrfQax46UGj58s93vsh/d1LjVN04m952A1bO
	 EUPWmdyqH6ilprycevjGeJLwLYv3j9cudvwElLQxLRjPH40Fi5ejW7FbqRxomnZ1n5OyI
	 T1rAU4XmEgZHWccWMDMgq1JKqAbx5jPgZX5uupIvUSQRAOoNLhkEAyOpKTdLJ/eApCf4o
	 EbH6xn6SGClkA4CaIH3B2PNqg6IQqHvCxO0mifL8sGrT7ghf8G11YcDAkWS7VqKS7gA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9T8VWNlC22pM1qjvLbYEaQzBzJ9S1PZJc2NX6XMx7dE=;
	b=0uhcKenO/OITkQoW5YxWasoPRose8Zp2mc00WRrJCbZTWwWBTce5fBRQO9RE8PrmTNR/
	 8+IwvMTV2k8EMHduBkPWeKxxXRte2G1+MAQmevupXh9CUM4JxJYVEF8HL3C5CSAzc9nor
	 zUZjxV0DOIHNrq6SOTaPHMW61QSOacmVvkz1zYc5O0v+oCjI3KJ+ljIXTAN95fKebJFAo
	 37fzVuP3wlB4s/QdUJcK5Q5Q1zx1PsAJ51uS6CiCzM3lKW47PuxWsKSV7POAiagv9IKpt
	 R4W3cEy5gVHEHxDwn44xZ3kOq9i83+AyA507M4t3kw4MUmW5jWHic3j7qLJZtFLrVYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfb4J9CF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9631B606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9631B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfb4J9CF
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38190551625so10753376eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:51:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585874; cv=none;
        d=google.com; s=arc-20260327;
        b=brMYWv23YYYI7dcBr/mh25pWgnZOYitpi+qTfqpZgLn+Zq/rUTrBgfneoPtgxw7Cj/
         aOy2TjF4OEfG+hxm+ql42BD91zEl9tdpw03JgQoOBZxik64ZYrFrR3aVtcPW7cOfrtg0
         uebBFzaWXqGFMHCpTTCYMjzXv0O1ZXaj22Ql9kaCQ2Gj/btyRTooc6ZiL9CuvI3px9Yt
         d86LxAjg+5KjFX4VvZ0VwJW4HrDd6/rgfDeEoHVQlJscn+kl9RxDzs/sivxjsXc8MCZm
         S8YCcafyEY6shaFtUy/3e8RivL9OvqIxN68QeJZ7C5uSBVFWfaja/cXGAwLe4eoLcCyR
         eNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9T8VWNlC22pM1qjvLbYEaQzBzJ9S1PZJc2NX6XMx7dE=;
        fh=xjbIVLM3JuqKRMjvGvavZh92/wxj4Dgr5a6Kf5Gkc9k=;
        b=GBgJTqpZcrz8ALzNdCfsuiioHe8SQ1/EoerpaPZxako4nFBbTeqxAudbp5zvYaUWZr
         9jeuxzodrcLEbPB0yBe4Xy2Y9YUmUg9Al65nWsxgopVoaETx5wHRcpiiy3HJQZuYXyTv
         VfXQ3qHwHI1WYpfK+PHK/s9BaDlxiXPFl91qLZHnmbjCXydIVebuQt972PQ7GChQx0L4
         XSm7TtIwCRRD98NQyhjBojkymz9Lga9rdCtbElsZwFXQ5jsEzN2lzJlR3qzFqP4jITol
         hecGWGhKi6b5Heopu72MSDSFbqbGJ3go+59v+YX3ONytU3NxcWkSg1Cso6uVRP9hdOHN
         y+sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795585874; x=1796190674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9T8VWNlC22pM1qjvLbYEaQzBzJ9S1PZJc2NX6XMx7dE=;
        b=sfb4J9CF+5yjZ/x/Iu7BFWCbJgOx5jjpqUiqLSNFSquy1M0qtMmn27RFXaMWciCfMn
         eEjJhWhPQSG7f63esOhYIuCQitedZEjca26PsfPOt0YMtriD5xjj2MZiVf/3ZLx2QFOl
         +Wg52BMCp1fizm2tYTbNHuH6IB3qhIxgD6Sg4JY4mKEL3EH4WPSbrWAntLcKznqcLIaa
         ux57gd/YQObMfbtzn7M4iNGX12h/6aeDyT6qGEjv82ySLL740fsUb6n9NDMZHEWe1CJX
         O9B2LRVmpPCj0g9iF1MJGLwxImwsCwIiQ7YhgJZ+CSqej/saT+XCQTxjkM7MkX6YxelR
         bm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585874; x=1796190674;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9T8VWNlC22pM1qjvLbYEaQzBzJ9S1PZJc2NX6XMx7dE=;
        b=AguRPQ1qzzXV2q5BME/iQxRpjk0K/apiMCPh0WyunnfCgo+eXQSSPgVk6Ft+R7JUgW
         y3obA51ZtJDi35CA4/rkrrYvHcCzMGvTAAkXmmFTmOK5Y1w3P+OOzddCz27E/jZu+tVR
         cco2fs+sFmzW/iX86MU3AV/wZkv6TB5+6ZazHxwcPJtVmN6qYkczo/gOMacmqUpHOnvR
         lTYPgSKsRsaIYYoD2nxiMvFbiNzrPELvpIONipA/FAoYe5BBcPGvV+jpGbbiQeP+h/ax
         nWnCu+ZE5j+zo4v4QLo0/Wq/7A4Vu0KBH9Xm+k1Pir8DtajGmpT9ZgJs9z6hcZq4O0ns
         WNrA==
X-Forwarded-Encrypted: i=1; AL+hErHSYTiXZxlcnmY7cFKGO9rRpG3ah3vtl28lc6wYd5hxJjzhTnjO0JUrDY9zFHWYu+156j+Ss2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tC5aTb525wwbNr/y0SYFIcX0Nx57Fv8xOMRNZWaxwTbb4KzeW
	wyBSqqZvUnNYc2l3ySmk5BygFMleSf+oSll3dJLssgj3zYToeeCOFjX9KeVZuafHb84AaNmmEmH
	UwU/5Wj9GymrEHsllujAVHjUA6b64eik=
X-Gm-Gg: AZFdTZcrc14J+GqBAmgPOminETE3CzKC8R5VhxO4YCHuOIZqs/8uJpEj005u9e9w4Zo
	PUe4odmxZcSyUIbJN+9Pu5Q5C4WnCeaPgYTht1hMEYU9hZ7ETp24Q6Lp3g/DSnQmyOPqj7C3cj0
	YHnnKU69J0pdgpqySt9SNYZRz2Rh5K3iRHTEDp5UBSl3vML3kj2kT5RyDTq+fHK4gmixsJFaj/I
	TW1g9ap2xlKI9q5RmZ+NMhKKqJoyO02bp7zygPgHb8XoX0UBs6nY3poPFhBOtZAFSlnyAVSNGNl
	mrLURhJ7D3vtzsslb8BRCWcmHbPPGgZHIgddP168W8KPRIvnvTcg9LBV0ZBMbd8ldoFu/8HnnoH
	+OMHpEj8+7lEdQGXXqJqqCmMOaQ6dbHeJH6+Aedw=
X-Received: by 2002:a05:7301:140b:b0:386:ca0e:430a with SMTP id
 5a478bee46e88-386ca0e44c5mr2612452eec.24.1795585873408; Tue, 24 Nov 2026
 21:51:13 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <b2853b9410d049e08b3e2ae2491e775506b4f0e8.1795122681.git.zcliangcn@gmail.com>
 <e6d7aa66-3df1-476d-a8cb-359827cd8243@ovn.org>
In-Reply-To: <e6d7aa66-3df1-476d-a8cb-359827cd8243@ovn.org>
From: Zhengchuan Liang <zcliangcn@gmail.com>
Date: Tue, 24 Nov 2026 21:51:02 -0800
X-Gm-Features: Aa3M54pDG29o7dVlFlqPFuvbM77f8i9ZHjtQ98m_VMlQguub6jqHv5TZuSqbqlU
Message-ID: <CAOny8pvHhv2UVYSv++pukE+0+G5+JNirQiGGVS3=O0Rrvw22BQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: openvswitch: avoid hashing the network
 namespace pointer
To: Ilya Maximets <i.maximets@ovn.org>
Cc: Aaron Conole <aconole@redhat.com>, Eelco Chaudron <echaudro@redhat.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 7:46=E2=80=AFPM Ilya Maximets <i.maximets@ovn.org> =
wrote:
>
> On 11/19/26 10:20 PM, Zhengchuan Liang wrote:
> > The Open vSwitch vport name table uses the network namespace pointer as
> > the Jenkins hash seed. When an Open vSwitch vport already exists in the
> > attacker's network namespace, unprivileged OVS_VPORT_CMD_GET requests c=
an
> > look up attacker-chosen missing names and time whether those lookups
> > traverse an occupied bucket. Ranking the resulting collision pattern
> > across possible KASLR slides recovers the init_net pointer and thus the
> > kernel text base.
> >
> > Use the namespace cookie instead. It is a stable, unique, non-address
> > identifier that is deliberately exposed to userspace. setup_net() assig=
ns
> > it before per-net initializers run, and it remains unchanged for the
> > namespace lifetime. Hash the cookie down to a 32-bit seed so vports in
> > different namespaces retain namespace-dependent bucket placement.
> >
> > Found by AI-assisted code review and reproduced on an unmodified kernel
> > without fault injection. After privileged setup created the resident
> > vport, the timing measurements ran as an unprivileged user with no
> > effective capabilities. With this change, the pointer-derived predictio=
n
> > fails. Existing and missing vport lookups behave as expected. Identical=
ly
> > named vports in separate network namespaces remain independent.
> >
> > Fixes: 46df7b814548 ("openvswitch: Add support for network namespaces."=
)
> > Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> > Signed-off-by: Zhengchuan Liang <zcliangcn@gmail.com>
> >
> > ---
> > Changes in v2:
> > - Use hash_64() rather than jhash_2words() to derive the 32-bit seed.
> > - Use u32 for the local hash value.
> > - Drop Cc: stable because this net-next change is not a stable candidat=
e.
> > - Drop the deprecated Assisted-by trailer.
> >
> > v1: https://lore.kernel.org/netdev/4e124b37fc972925a825881c50f95eb6b3c2=
e231.1794989369.git.zcliangcn@gmail.com/
> > ---
> >  net/openvswitch/vport.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/openvswitch/vport.c b/net/openvswitch/vport.c
> > index 083f7a8d9d4e..04e4df103b26 100644
> > --- a/net/openvswitch/vport.c
> > +++ b/net/openvswitch/vport.c
> > @@ -4,6 +4,7 @@
> >   */
> >
> >  #include <linux/etherdevice.h>
> > +#include <linux/hash.h>
> >  #include <linux/if.h>
> >  #include <linux/if_vlan.h>
> >  #include <linux/jhash.h>
> > @@ -53,7 +54,8 @@ void ovs_vport_exit(void)
> >
> >  static struct hlist_head *hash_bucket(const struct net *net, const cha=
r *name)
> >  {
> > -     unsigned int hash =3D jhash(name, strlen(name), (unsigned long) n=
et);
> > +     u32 hash =3D jhash(name, strlen(name), hash_64(net->net_cookie, 3=
2));
> > +
> Sashiko had a nice comment about using net_hash_mix() as a seed, which
> seems to be a good idea as it fits the use case pretty well.
>
> Best regards, Ilya Maximets.

That would allow an attacker to recover the 32-bit net_hash_mix, which
is reused by other networking hash tables.

Best, Zhengchuan
