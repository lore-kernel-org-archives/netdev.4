Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795532026;
	b=ljpdg9txq43atZy6eMhjqrmKp9rfWyrcp7JxLs96lrhUtnkH8OvMLK+IgiGkb1FelyEi
	 t/jWIGCFAdMAmjP2HmgBykZf8lDeNHhpXN9yWRU7so26kwIS0fXTs5Dq5vZdSiaIzTv/y
	 ST8Em8M15z1v4kpR2b1zhPPXyorfYOoxaNTwzZKLxhRFzIpfx8Wc8X+cCa6jtwD1T47oE
	 zQTZDy0+IAdumjIKVR/7C3UQggZNZ5NUD/QKiTmUqmEzF8pUqDEeQsaJaZdXz289Q880H
	 VMpO2xrFgT2JBscywq3jPjH5zlw1S1O7h02x/KQGloQXZTdzDp4/OSA2RqPvYfNtTHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p4wXMx28wnrcUl8Oo79c8VzU0Hk3YuGD1icb2+Qx9Ck=;
	b=FUMrp02aNVi79LlV3pH/jCZmjE1BQdgK4s2/EYBlhSg7mlWyKLi+NBlALVIfNTwpvuKr
	 SkY8BtyGEOGa9S+W+zRpAD8cYX+1bLYjWnnk/Lx58G4nDI+WWh3sQnQbOQLLacPgMvbIP
	 O52d7DGql/Q6JHjcF5sYVFxCIHvwKkzTSHlmzt+44fSstCqIiowtv+AulzB6q8n7G/ENI
	 EPO3cg6h8ZSL+Zd8vhimZq++H+oyyGv4me3arhCoJjSKMTqFtpEviNbCfDWa2O08OCePh
	 Gslvws6khNf36VCx4EvxsUNf40zqAdxDSIpi/PNfChHhoVmH5WfEAiQjghA6uwu6x/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCwzg31b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6611606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6611606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCwzg31b
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so4552136241.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:53:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795532023; cv=none;
        d=google.com; s=arc-20260327;
        b=DFjBXCS0qvhPcg+eugY1UP+/R/m1LbpXwQvdds0N5KEZyMmFdFsNP8/MEma/Y7vr2i
         TKo87lQhwVdClM67Cp4eprZoGOZjA1F5oKYRnsiDZfGSp+fHN6wal1329meLG045/BvD
         9JUstWFRtGttuiZpqHk6ronEkSW2XjTXMEeDNXSz7luDdvCf2TOL5laZQ3qwYMan9h8+
         7N2pajgcwYvY/6yn/uidgtl4epFeGVyk83cbP5VlHRLxln9CTCGpPbbQqNwEjx5EcYHN
         q3U9grMWPmLCQ7CEyI1l1a5tZb7FoG6aDrgumOsa0AW6WOfgyWR2ESFnhhoJGsZTQFoR
         3rrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p4wXMx28wnrcUl8Oo79c8VzU0Hk3YuGD1icb2+Qx9Ck=;
        fh=pQ+g1JKhKfTa6UGtcQPSnJxGNVJlX/BqyRmjaEZ2BSs=;
        b=Pyom9iAB3pXYmlcIptbdrdyIUD17G7xwBaMe7YjXaQqPiiko/qp84lOQALJxyW3/aq
         JQYXRK1YutnnFgpozORBq3IMrzzJNrCrP9xHLgGXq7Zh2K/afxC+KrJPGL4mE8/6jb2O
         JdUuZ9zXM+OsKvHI6q3jgeLfEriGLEK1bJw1PdJIxWeQuSr83DoF/pYFs7q1qzoaTZ+f
         CucanSIewXwwdj6XtZgqg6sag/YlOeML46sL1zVr1bPitnu5EDMrk36hzZHoNuXSeBZW
         oAoATWg8xaFvwW/o1ouZhcFXCxtjBWtTXJ0eIHQi1GHwJ3kC2/1UPrTVDmQV00NDwnPM
         9TBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795532023; x=1796136823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p4wXMx28wnrcUl8Oo79c8VzU0Hk3YuGD1icb2+Qx9Ck=;
        b=kCwzg31b61xUyZ1Njmby56I4y75QoAPpwh26ScOgN4ObCP0v3GTn/gcSpD6Ai3+HTT
         cPjO8rJTx3sKEr3drMT5RdCV/3SucTbD90GkS+RQ9zIQqGnhM6Nk6TnU7bsdepsmYKWm
         O88NbMPfBePRhUQQbmmky7hr2J6qSvk2NDdfXlcf1ViRjvuxcU3A3a+nffyHdNTyzP04
         I/rcTyISn/ZcLnRsweDHSZflYNaIFGB2RgLBJ8l41EB1hEzeFGCvdGHuD9QanpWGwvbE
         E/vS2mkkfsPFSuHrUPO66LnWor+wVe4coX9xwu82qObIiQQEsgLPciMG3NCoVapZfKbF
         salw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532023; x=1796136823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4wXMx28wnrcUl8Oo79c8VzU0Hk3YuGD1icb2+Qx9Ck=;
        b=2cVj+DZtHiVtZmh7zC0OST5vknLl/6tXX5uP7bpEqCtaEPOrYhKIzbkiZbSkqqgQy9
         Cgkk4vUB+O1tz4YBOo4Ph30GTS0KNjyiVvJoluvJ06V+hFnJVUkRWcNHCJpKNc2QLp/1
         CEiQ6X29034/rMFS8oBmVjHuSZhLKVfl9CV6nuruV56LBJcKAUegf2S08LasedxRv0u0
         XLfgD4f81N8i/mBobPUTIRV4/087t4jec4jylDRuEJubwv8LOA6KF25ZYeZv57ustrRi
         qgScieFW0xWvjyvaP585bPbIbanAmi/1ayzXJ8aNnRjXyQD8qkxSjOlYiLJzn3QWF6Gb
         Zl/g==
X-Forwarded-Encrypted: i=1; AL+hErFIlTBSaQTHKaUWaK2aVboGyrqjnamPigPjIGl/ZyXtEJm/H+FlGxk0gDDxusYRHJfd0pJq9qM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bdmqEa7rmIe5qJRiHgbcTH1XF+D2xno+tjqOxhZhZUNmLmrwk
	4J0RXxE4LqaHXOPXQwUB560724hRFEsNAp9EMiduqa9TAcR7tVslnySa+cGRdBjhkNeuMpjc8om
	khzn5URt6a1tH3Gf7JzZYvTG40P5fHdc=
X-Gm-Gg: AZFdTZe3LWbC8XpmxOlz+8pl2+Px9EjrOWWe5xHopXWptgYfLCl3taB/4ICp2PQGdso
	9oeqOEVyR/HcBzo8LTFE0qUAe4ZH74Ie3Wsko9bnGSvW8P5/JDgkLXVTEu8MDXUwvWorjeTnK4c
	wDt8pyA6znCINcilfUJ3sxJ8OpqtAT8TchtuCWjzdaTN4LaNC0A6HjX8TzSmLLQqe/RpBv9zud9
	k3KiIRhMltoR/LUXJkXJ0dSkaWP1pRvPKdBXWzM8izT7piXFrpKbccsD6h4rK7dgJT5cRFLybj+
	iZbx5H136QgpibOd+QA3TjSz2hScid63PWolbvYcIARgLQ3ggeGBfiNwhJt+vWmP9vZqKmoiyZm
	5hlxZhfrKsjqG+AmaQar+si5Ib5cH38V0sx8UDcjulE6YUBR9L5G1WhUaezst14aB0YAHy1btEA
	q1vKEferTZVwcab4GXGnPp79y/Ow3WskwhzoL/wg==
X-Received: by 2002:a05:6102:3f8f:b0:7d2:cc91:1aaf with SMTP id
 ada2fe7eead31-7d6dba78adfmr6131696137.43.1795532023428; Tue, 24 Nov 2026
 06:53:43 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120035521.2098757-1-pkfxxxing@gmail.com> <179549363640.3135.12116855475874204489@kernel.org>
In-Reply-To: <179549363640.3135.12116855475874204489@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 24 Nov 2026 09:53:30 -0500
X-Gm-Features: Aa3M54oPzesmcTAa1PYzdqgYL028mdClhKf8Jmt-5seWny9gepW1GQ9oSpeVJM8
Message-ID: <CADvbK_c8yk1taX2whZHTn=F-yhkvZjBLXtmJ-JqVrFU7o9kkFA@mail.gmail.com>
Subject: Re: [PATCH net v4] sctp: fix use-after-free after association migration
To: netdev-bot+sashiko@kernel.org
Cc: pkfxxxing@gmail.com, marcelo.leitner@gmail.com, kuba@kernel.org, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 11:13=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 (1) =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The patch makes deferred PMTU handling lose valid MTU
>   reductions.
> - [Medium] sctp: unlocked state mutation on migrated sock in
>   sctp_icmp_frag_needed()
>
> Pre-existing issues:
> - [Medium] The deferral branch of sctp_icmp_frag_needed() does a non-
>   atomic read-modify-write of the 1-bit field t->pmtu_pending=E2=80=A6
>
> --
>
> sctp: fix use-after-free after association migration
>
> Timer and ICMP handlers that cache asoc->base.sk now check, after taking
> the BH lock, that the association still belongs to that socket. If it
> has migrated, they defer the work as they would for a busy socket. The
> patch also moves the PMTU size check from sctp_icmp_frag_needed() into
> sctp_transport_update_pmtu(), and adds READ_ONCE()/WRITE_ONCE() pairing
> for the socket pointer.
>
> > diff --git a/net/sctp/input.c b/net/sctp/input.c
> > index 9494cfa51106c..555695718abf9 100644
> > --- a/net/sctp/input.c
> > +++ b/net/sctp/input.c
>
> [ ... ]
>
> > @@ -372,12 +372,7 @@ static int sctp_add_backlog(struct sock *sk, struc=
t sk_buff *skb)
> >  void sctp_icmp_frag_needed(struct sock *sk, struct sctp_association *a=
soc,
> >                          struct sctp_transport *t, __u32 pmtu)
> >  {
> > -     if (!t ||
> > -         (t->pathmtu <=3D pmtu &&
> > -          t->pl.probe_size + sctp_transport_pl_hlen(t) <=3D pmtu))
> > -             return;
> > -
> > -     if (sock_owned_by_user(sk)) {
> > +     if (sock_owned_by_user(sk) || sk !=3D READ_ONCE(asoc->base.sk)) {
> >               atomic_set(&t->mtu_info, pmtu);
>
> [Severity: Medium]
> The association can migrate between the READ_ONCE() of asoc->base.sk
> and bh_lock_sock(sk). When that happens, sctp_err_lookup() still
> returns the old socket with only the old socket's slock held. It
> counts the ICMP in LINUX_MIB_LOCKDROPPEDICMPS, but it still hands asoc
> and transport back to the callers.
>
> sctp_rcv() handles the same window differently. It drops the old
> lock, rereads rcvr->sk and takes the new socket's lock. Is there a
> reason sctp_err_lookup() can't do the same?
>
> As written, the migrated case falls into the deferral branches of
> sctp_icmp_frag_needed() and sctp_icmp_proto_unreachable(). Those
> branches still modify shared association and transport state.
>
> sctp_icmp_frag_needed() writes t->mtu_info, asoc->pmtu_pending and
> t->pmtu_pending. t->pmtu_pending is a bitfield that shares a word with
> t->dead, rto_pending, hb_sent and the other transport flags. BH and
> process context on the new socket update those flags under the new
> socket's lock, not the one held here.
>
> sctp_icmp_proto_unreachable() checks timer_pending() on
> t->proto_unreach_timer, then takes a transport reference and calls
> mod_timer(). If sctp_transport_free() runs on the new socket at the
> same time, its timer_delete() of proto_unreach_timer can land before
> this mod_timer(). The timer is then re-armed after teardown and keeps
> the transport alive until it fires. sctp_generate_proto_unreach_event()
> should then see asoc->base.dead set and bail out.
>
> None of this is serialized against the new socket's owner. The only
> lock held belongs to a socket that no longer owns the association.
>
> The busy-socket case has a similar shape and predates this patch.
> Before the patch, the migrated case ran full ICMP processing under the
> wrong lock, so this is an improvement. It still isn't fully closed.
>
> Would it be simpler to switch to the new socket's lock in
> sctp_err_lookup()? Alternatively, the ICMP could be dropped entirely
> once the association has moved, instead of recording deferred PMTU and
> proto-unreach state.
>
This is a pre-existing issue.

> [Severity: Medium]
> Can a pending PMTU reduction get lost here?
>
> The size filter used to run before this deferral branch. Now that it has
> moved, the branch stores every Frag-Needed/PTB value in t->mtu_info,
> including values at or above t->pathmtu. t->mtu_info holds only one
> value, so a later report that cannot lower the MTU overwrites an earlier
> pending reduction.
>
> For example, with pathmtu=3D1500 and the socket owned by the user:
>
> ICMP#1: mtu_info =3D 1200, pmtu_pending =3D 1
> ICMP#2 (stale, or from another ECMP path, matching vtag): mtu_info =3D 15=
00
>
> On the next transmit, sctp_packet_config() or sctp_sendmsg_to_asoc()
> calls sctp_assoc_sync_pmtu():
>
> net/sctp/associola.c:sctp_assoc_sync_pmtu() {
>     ...
>                 if (t->pmtu_pending && t->dst) {
>                         sctp_transport_update_pmtu(t,
>                                                    atomic_read(&t->mtu_in=
fo));
>                         t->pmtu_pending =3D 0;
>                 }
>     ...
> }
>
> sctp_transport_update_pmtu() is called with 1500. The relocated check
> returns false:
>
>         if (t->pathmtu <=3D pmtu &&
>             t->pl.probe_size + sctp_transport_pl_hlen(t) <=3D pmtu)
>                 return false;
>
> t->pmtu_pending is then cleared anyway, so the 1200 reduction is never
> applied or retried.
>
> Wouldn't the association then keep sending packets larger than the real
> path MTU until another ICMP is processed? The new migrated-socket
> condition also sends more ICMPs into this unfiltered branch.
>
> >               asoc->pmtu_pending =3D 1;
> >               t->pmtu_pending =3D 1;
>
The scenario requires two ICMPs for the same transport to hit the deferral
path in quick succession, with the second carrying a stale, higher MTU.
This is already a narrow race.

Even if it occurs, PMTU discovery self-corrects on the next oversized
packet, when a non-deferred update can take effect.

The original sock_owned_by_user path already had the same single-slot
overwrite limitation. The patch only extends it to migration; it does not
introduce a new bug.

Thanks.

> [Severity: Medium]
> This is a pre-existing issue, and the patch did not introduce it.
> t->pmtu_pending is a 1-bit field that shares one __u32 word with other
> transport flags in struct sctp_transport:
>
>         __u32   dead:1,
>                 rto_pending:1,
>                 hb_sent:1,
>                 pmtu_pending:1,
>                 dst_pending_confirm:1,
>                 sack_generation:1;
>
> Here only the cached socket's slock is held. In the busy-socket case,
> the process context that owns the socket can update those bits at the
> same time.
>
> In the migrated case, code running under the new socket's lock can do
> the same. Two examples are sctp_transport_free() setting
> transport->dead =3D 1 and sctp_assoc_sync_pmtu() clearing pmtu_pending.
>
> Could this read-modify-write of the bitfield word lose a concurrent
> update to one of the other bits, such as transport->dead?
>
> The busy-socket form of this race goes back to the original SCTP code.
> This patch adds the migrated case as a second way into the same branch.
> Before the patch, that case did full PMTU and retransmit processing
> under the wrong lock, so the patch reduces this exposure rather than
> creating it.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261120035521.2098757-1-pkfxxxing%40gmail.com
