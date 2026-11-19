Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795108883;
	b=ormYRpAv4sdR/m9zLMpAbQXX4aDSMdo0WYwSEAXAiNCVfT+1nl9aUOC22Pe6H0YQcUFg
	 YF6vmHgO0nDH4pjTYieym5/x08gzXfEKD1EHHC0Dod7ZYHVuiDjDaKOtEWcezVhskxZLn
	 sRelawSk1aYJraSrqSKh7zFnqmPs5IeFC7JsdzpMbJSKMvAKjL2YezC0Dm5R3E5n72iXD
	 rV7GrFspmJgp5Xx3M7QJOlGQoKuHJCYyrjTfAC+LiSfRw5E20asULmtURDXJeHyN8d/oF
	 /+ysGo30yZL9vkQnHM01HOgbhkGGmKhHkteH/6koFYRxskM/aC3J2X3XI6lZ6BYbadA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9+Wpo+rVuAhgDi7GaMibOozackcQ8FbSjOHycDbmxqE=;
	b=VB/5CIZxGVisi8vInIykdyTrclT7LSHIVzMBF0yUuOgP95IY7XGRQlXZFcqQ+PQzlqg5
	 pYij6K5ZVXZrcu9eYqDsCkSg+OJSuqVMFhZBckRnpzKvL+p848YBsUAqMrsX0fT8TpiOi
	 dZMWKMoQbE/rSAe+Im5aENs7kM0I0FEOecBAIQLHKZKaOsyjDd03dakCgRFAC+gm1fL55
	 a1LabOtr5Fb3G2V+5sBErIlROQuYqAZnTUN0tIB3+yU39J+NJpjWtZreEQoDWd1NYKK0z
	 ZnkQZ6dLBoGCKMc+9aRu7wHLXFAWav7Vq1fz7EtGYPhhUwIxiS+doqXxPj/X3slf7AA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="c3GP/f+t";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE80606A32A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CE80606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c3GP/f+t
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ba12b00c76so1185131a12.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:21:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795108881; cv=none;
        d=google.com; s=arc-20260327;
        b=PxcrecoQ4DaonqzGU7KLRv4hA7i3fj58pVamgo1XcIzCw9S/QR5mStZrkl1hufUWie
         HXjKSvQBbdS0YdzODXR/tHyiZVEcrRcY07PwBfi/YtDKm92gUm2JX15M5p2tj57epnYp
         n/fSIYM0QtE+pvyYMGpDGxmzvCcsHKTwb3Ch5kgesn1Nd9zc2qgkyoUgKQGuDUyU2tv/
         +lUEaHuOETmRKwP96+3ctcWdpgj9eKQQ5MR+1Wpe2Ba3/8zejVLEh5bgoBabNQmBmy7b
         b6270h/3kxAdCbOLS4Dcm7rE+R4X7k9xVoeREESZLt9LdrUJMYmfXd2Dlte7kzx4t4cT
         JeVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9+Wpo+rVuAhgDi7GaMibOozackcQ8FbSjOHycDbmxqE=;
        fh=u60K2spFMakgt2lRRnSulXqd4kgCQghrgYKAgX7Sf1s=;
        b=RF4lIarIQWhGFQdUqgLkRGfAzbX9u3fatJeBEUe1LKxuqdRj5PSsI4PQCWorKATfkr
         xHcNpj/LWYYQz6aYx5f6fJAVd+6voInDlO+tlaO3bocH6qR6Q71Bkcou8fdywond5gHS
         3CZoDcThmLLvBoMkw+wXoHME2v4sGRJifwmrEim1mgI3uW3deGLwE1HSLjbbLZwldK2T
         wcGiybfdx2vMPqaC0osdbLcoyL9BZhFNQNxigiUiHUxp+L8GguULPFwFL/4EFM5XhK+5
         OC/gm7o9haqTaxj+AqV7NlkQ29/ogI8Aiw+tYtRY3+nBRQXncFRet00Bmy09ZGLCUWVQ
         FGRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108881; x=1795713681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9+Wpo+rVuAhgDi7GaMibOozackcQ8FbSjOHycDbmxqE=;
        b=c3GP/f+teQzkEHFch/dYZZh5G7GlLPm8n3VAiZpw4VNfHRiIJPSpv4dcErTDCpfPyK
         CKyjMca9AYjuSTxjhJIN1fPBxk16VQLTd8KTqSHOrWbk/eu0c0nuoNQLtYfNx9GvC06k
         AwLKOHkeaKvNiSQgOVcs8KdmSK0f6fg2vUNz8SutQpHHSTm3WGAJJM32tz/kjJWojfMM
         iSCgfHlIxHRoj65IsyDb/eNEQOYY8HE1gPLMqOAnVXk3KYVJpRQ+lAmpQYaUJXk7SYlI
         myx5r+bSNAMO71D92JNEnq9Ic4QWgr6q5g4YZvxLe+WG/727euPc+eOnlCpz6eUpuPez
         7Zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108881; x=1795713681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+Wpo+rVuAhgDi7GaMibOozackcQ8FbSjOHycDbmxqE=;
        b=cW4GbTLKe5ci55kiBwxtHfNRa/RCPsOVGqd428KMCLpy3w7niEdfwV1vhFZXbQ5HjZ
         Qx85cv111jy3jZL9JhiLILXYuh1yP3LwTERRI8ksn5GRY9STAbeTjx2mqgOS+y16YTqj
         bHxOu12ua36vabef6G3GGourjtX9nyK/p0kpoTdtC2nocMb3ITf/PEc8fReHICQh3XL3
         ka+NB8t6ruGK+v2UBumtJ6owQ0M5lHz4gEl/ljTiUARzrT5Gqrzi6kjhPqlBAyGS2rKr
         shLeE8EY1UWL8Ay+ZzI+nbWr7Tn3zh2+24bpe5vMgsrlsJuVLEh5iqmGWeCA+Yq3mAWC
         iCFQ==
X-Forwarded-Encrypted: i=1; AL+hErFWv7H0K6lL+i+xWVngI+8OgOXe7PsUrXrCELoXyhD7WprOMocYokN4gz8gCTCb0XLrbs7z6CQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BCvRkrSNfMoiVLk7Si/EJyBnNUhtJbE5rZCdNhF/uz0X3y2fW
	c/XxDA3zUVJoxgvZRPoehBUl25LfroSGB5k3LeETnprY/MtBqxfFFRSAbXL+WUcj+835Srgavom
	fli4S3GyQw2/xukfpBwai/sYlcIr4oGI=
X-Gm-Gg: AYBFou1d8AvU/cOK3SBk3lMaq2LK5I2KNuvOoEFAq/Vbj647qf/GiyAqiwxZOzMX0Pz
	bfVf7fvgSfIBl9ZT3nDe0fXOwkAtOqka3w0hcsgxOBd/t9muRC5ZtIFcfuVRhH4gEKaAqYygyta
	EwZEvBQC+EbT2lyHbfC5F54N6nAb/z9PBYDqRc0vs9Bpox4Qp54jC7jwJdAQ8gRZb5reBPPo6cI
	OCTBTgmHNzVM+JI2i3W4brWeuZBboVXNz6XEacEXdSwMSWu2gnS8UTRQym+tSsQ3AtBTly0lpsU
	ShosAIX9Z5yAWDuVTCIkrzRxAY3M2oD444IXCAAdw6SapF2d4a8OiifTXvxxMyK9yRkKaZyezez
	eQ0Gs4wmnS3cbePkT0gi1cZsqCdpEnEtkrv8YHfnxI6vEWoXLj2KWG0cYekrb3IURD2dCkxU=
X-Received: by 2002:a05:6402:c54c:b0:6ba:36b0:3207 with SMTP id
 4fb4d7f45d1cf-6ba37e69823mr5555a12.13.1795108881438; Thu, 19 Nov 2026
 09:21:21 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117041029.80543-1-juanagusnicco@gmail.com> <179510476492.3136.15185317023274420078@kernel.org>
In-Reply-To: <179510476492.3136.15185317023274420078@kernel.org>
From: =?UTF-8?Q?Juan_Agust=C3=ADn_Nicco?= <juanagusnicco@gmail.com>
Date: Thu, 19 Nov 2026 12:21:08 -0500
X-Gm-Features: AclHuK-zJpLBGFXtmIIgaJV5q4o4q2kCjQ0v7081tz_orFt7g4xlF9-QouNmhuM
Message-ID: <CACQ4AciGFKQUxu7PVz+BoOAq60nW9B+cHasUsmh5jg=Gn=f7wA@mail.gmail.com>
Subject: Re: [PATCH net v2] tcp_metrics: hash the destination address with SipHash
To: netdev-bot+sashiko@kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The issue Sashiko flagged looks like a quirk to me.

On the collision route Sashiko describes, the attacker has to be local
and needs on the order of 2^32 connections per target address. I
couldn't find another route, and the worst case is still a local leak
of peer IP addresses that only applies in specific configurations.

I'll look into whether it can be addressed at no cost on every axis
(backporting, clarity, etc.).

I will send v3 today including Eric's requested changes and
answers to his questions. I confirmed the remote leak is exploitable
even on high traffic hosts.

Best,
Agustin


On Thu, Nov 19, 2026 at 11:12=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] In net/ipv4/tcp_metrics.c, tcpm_addr_hash() hashes only the
>   peer address, with one global key (tcpm_hash_key) shared by every=E2=80=
=A6
>
> --
>
> tcp_metrics: hash the destination address with SipHash
>
> This commit changes how a tcp_metrics bucket is picked. It used the
> ipv4_addr_hash()/ipv6_addr_hash() fold of the peer address and now uses
> SipHash of the address with a random key. The goal is to stop attackers
> from computing colliding addresses and recovering net_hash_mix(), which
> is still XORed in afterwards to separate namespaces.
>
> > diff --git a/net/ipv4/tcp_metrics.c b/net/ipv4/tcp_metrics.c
> > index ae551546422fe..1d6c88bc35cc8 100644
> > --- a/net/ipv4/tcp_metrics.c
> > +++ b/net/ipv4/tcp_metrics.c
>
> [ ... ]
>
> > @@ -95,6 +96,22 @@ static unsigned int                tcp_metrics_hash_=
log __read_mostly;
> >  static DEFINE_SPINLOCK(tcp_metrics_lock);
> >  static DEFINE_SEQLOCK(fastopen_seqlock);
> >
> > +static siphash_aligned_key_t tcpm_hash_key __read_mostly;
> > +
> > +static u32 tcpm_addr_hash(const struct inetpeer_addr *a)
> > +{
> > +     net_get_random_once(&tcpm_hash_key, sizeof(tcpm_hash_key));
> > +
> > +     if (a->family =3D=3D AF_INET)
> > +             return siphash_1u32((__force u32)a->a4.addr, &tcpm_hash_k=
ey);
> > +
> > +     return siphash_4u32((__force u32)a->a6.s6_addr32[0],
> > +                         (__force u32)a->a6.s6_addr32[1],
> > +                         (__force u32)a->a6.s6_addr32[2],
> > +                         (__force u32)a->a6.s6_addr32[3],
> > +                         &tcpm_hash_key);
> > +}
> > +
>
> [ ... ]
>
> > @@ -329,6 +342,7 @@ static struct tcp_metrics_block *tcp_get_metrics(st=
ruct sock *sk,
> >               return NULL;
> >
> >       net =3D sock_net(sk);
> > +     hash =3D tcpm_addr_hash(&daddr);
> >       hash ^=3D net_hash_mix(net);
> >       hash =3D hash_32(hash, tcp_metrics_hash_log);
>
> [Severity: Medium]
>
> Is net_hash_mix() still enough to keep the namespaces apart here?
>
> tcpm_addr_hash() takes no netns input and uses one global tcpm_hash_key.
> So S(addr) =3D siphash(addr, tcpm_hash_key) is the same in every netns. T=
he
> namespace only comes in after that, in tcp_get_metrics(),
> __tcp_get_metrics_req() and the netlink paths through __parse_nl_addr().
>
> For two namespaces A and B, the bucket maps then differ only by the
> constant mix_A ^ mix_B. That constant is applied before the invertible
> multiply in hash_32(). This is the XOR-then-multiply structure the
> changelog calls not a PRF.
>
> tcp_metrics_hash is global. A local user who owns a netns (a container,
> or unshare -Urn where unprivileged user namespaces are allowed) seems to
> have both oracles the attack needs:
>
>   - tcpm_new() reclaim reuses the oldest entry in the bucket no matter
>     which netns owns it. So another netns, such as init_net, can evict
>     the user's own entries.
>
>   - TCP_METRICS_CMD_GET has no GENL_ADMIN_PERM and the family is
>     netnsok. tcp_metrics_nl_dump() returns the caller's own entries in
>     bucket order.
>
> Because S(X) is shared, take an address X that the attacker controls.
> If X collides with a victim address V in the attacker's own namespaces,
> it also collides in the victim's netns.
>
> Another route is to solve for mix_A ^ mix_B from cross-netns evictions.
> Either way, the attacker could watch V's bucket in the victim netns and
> tell whether V connected.
>
> It isn't clear how cheap this is in practice. The S-collision route needs
> on the order of 2^32 own-netns tests. The other route needs more than the
> few hundred answers described for the remote attack.
>
> Still, the changelog says:
>
>   net_hash_mix() and hash_32() are kept, to separate
>   namespaces and to reduce the result to the table size.
>
> With this construction the namespaces don't get independent bucket maps.
>
> Could the namespace be part of the keyed hash input instead? For IPv4
> that could be siphash_2u32(addr, net_hash_mix(net), &tcpm_hash_key), and
> IPv6 could add the mix to its input the same way. inet_ehashfn() does
> something similar: it feeds net_hash_mix(net) into the hash seed instead
> of XORing it into the output.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261117041029.80543-1-juanagusnicco%40gmail.com
