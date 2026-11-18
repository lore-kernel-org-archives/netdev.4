Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966216;
	b=PKQqPGbmDLuKbDs09OnQbhpSfFZQ9gymSKXgx2ZgUK+hjSwOQNYkkZVBOhO1ot1950He
	 M49i0RGrFbHbIDtKjT0CoACFcq9xdYbQCZDnF2a5a09qDP0g5NL3Y7ROZoHVN9UmplUui
	 6ShoMZG0mVstNxgN8ZG6VlmvmfgMne8f3/PrEqVyGNe0V1m7LjfJU6VB9uCdJUD1o/cWj
	 dJ90sc2zTGAlPWuodQLCUkCzoOHmNoBKd9+mXAzclyLLfVLqKQ1jTWVRTf6KaslqqNGtX
	 YjneXs9LFL1+J8jnprK0Yxz8UOuifeA2LI2C757O08zOOpTOdIrOVfgJaUliAQzvbeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=kKlGHvTk66tnjyxHSaybi4Kvz2UdI1L5CVtvqnc13hk=;
	b=recu++WO4LBBuAVwYmsjmBMqiGAFmiSj7yr9rvNmLDrqzmS1NAs9Vug4FEqiL3AYiTOD
	 yuxCIVWWCuT2Q3wkv6aZdLuSoz82eKLuGdNt9bUIB/9pUwBDaxFrr6OAJAAanE/vXfXmh
	 p3uJitmPu+YEP1NWDvMrHDjaTuOYwEyDyBZ+YvXevesOf3qhqjsXWCafRZN5xU/tyjtdo
	 sDS4phV2wBNXj5G/alTuw1/3PxjS8CSTPTNdeZAQ3z1lfWb+PJUiERz07CaLGza1G+Wie
	 xdjdJ57O+wIBPzOIlZdbc5SOW4nxTBKoEL/DlTwt4XdTcC6l9G4LbMq8A5nEe3fD1Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YkVOn2iZ;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F130C606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F130C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YkVOn2iZ
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eddadcce7cso2396255ad.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794966215; x=1795571015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kKlGHvTk66tnjyxHSaybi4Kvz2UdI1L5CVtvqnc13hk=;
        b=YkVOn2iZ2Dofhk85ArJ68JCcqjn9S76NtbauZOLK/YmUT7yalcucNrvZtt0GwD6Yw5
         AICZY0XqM0NbBKurEJNqebftG4KVtdfPRWQzq83bIl118/hDPIpk8FXGdPTAYLE/xbdj
         aTldQzpBb8NTUBVaGg6ps7IgN0uGVhbsJBXeZGWa27nMZlDs2x8jwp8lOAL9TNheokmN
         oo0E8wplRqXwXWlWJIxvXkrM6LAbww6l3x2ueSEt4BSVRcv1uhoti+TDJZrZ3UaE+ufq
         cmW+k2nae/x1yiHS1JTG4873iCQIcunsQo1xUxlF0XuYBTUde2vqKzpKvksiUlgDqqyj
         vYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966215; x=1795571015;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKlGHvTk66tnjyxHSaybi4Kvz2UdI1L5CVtvqnc13hk=;
        b=kmhEQAid4prv6Tn7/+b9CvZaQzan+gHpm1ZT83JZAFZaeEBnEVSCju5wWkPH0fm5lZ
         4rwbVRG9KGWxAj2dwvlHcIaLOL/jWbgjouUFq1Y+oaVuxejp7uP62zhAOWtwEMdHJYu1
         NuELffS4z6i63l285IaoWxgXlM9ReSShSytEaM8fH3/iHObARXhd3UhWApRqVMwRE+/m
         2K4FmoKWZN3oy+qeqpT4Y/RMGSfouHeNkJ7n2k7lZf3GLJti6RUFi0ElQO+aGsp1PdZU
         bRw/SbxMofXZ791yR7J2tdmmqMhakRuoVhjYV6g2g+N2FL3SeyWhg3U8Gz2yljZvXj5+
         AuMA==
X-Forwarded-Encrypted: i=1; AL+hErGJw2xwJtN4guRN2YcfwP1KnZtZKma1PQb8vqtxAWy8Z33Dz1qLB34tjZNbTU3Wf/JVXsNhLBw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+u+uFEx3KGDlME7xRZ28MKId0kFhoMU9wTjp9IQo2SWajqCLb+
	2JbqLpPCPS//9rG/2D2jI4kzeNvi8Lu6+oJpF2PAqNmCDHGEIBONqjflNqqdRVcur7dDY2EGEmx
	WSv6fgA==
X-Received: from plbkx3.prod.google.com ([2002:a17:902:f943:b0:2ee:192c:eed2])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2304:b0:2e9:9263:a6b
 with SMTP id d9443c01a7336-2eff7525e17mr9946245ad.40.1794966215087; Tue, 17
 Nov 2026 17:43:35 -0800 (PST)
Date: Wed, 18 Nov 2026 01:43:34 +0000
In-Reply-To: <179493597161.3136.12291669288172895358@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116021845.2533130-3-kuniyu@google.com> <179493597161.3136.12291669288172895358@kernel.org>
Message-ID: <av0Bcx8x4cM5ZLyF@google.com>
Subject: Re: [PATCH v1 net-next 2/4] selftests: bpf: sockmap: Remove AF_UNIX
 MSG_OOB test case.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, kuni1840@gmail.com, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Nov 2026 17:19:31 +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>=20
> Low priority / nit picks for your consideration:
>=20
> - [Low] In test_redir() and test_send_redir_recv()
>   (tools/testing/selftests/bpf/prog_tests/sockmap_redir.c), the patch=E2=
=80=A6
> - [Low] At this commit, the only selftest covering AF_UNIX MSG_OOB with
>   sockmap is gone: the `{ AF_UNIX, SOCK_STREAM, MSG_OOB }` entry in=E2=80=
=A6
>=20
> --
>=20
> selftests: bpf: sockmap: Remove AF_UNIX MSG_OOB test case.
>=20
> This commit removes the AF_UNIX SOCK_STREAM MSG_OOB case from the
> sockmap_redir selftest, because MSG_OOB support is going to be dropped
> from AF_UNIX. It also removes the socket_spec.send_flags field, which is
> no longer used, and the OOB handling in test_send_redir_recv() and
> test_socket().
>=20
> > diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_redir.c b/t=
ools/testing/selftests/bpf/prog_tests/sockmap_redir.c
> > index 9c461d93113db..e73d3a674a741 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/sockmap_redir.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/sockmap_redir.c
>=20
> [ ... ]
>=20
> > @@ -255,20 +251,6 @@ static void test_send_redir_recv(int sd_send, int =
send_flags, int sd_peer,
> >  	if (recv_buf !=3D send_buf[0])
> >  		FAIL("recv(): payload check, %02x !=3D %02x", recv_buf, send_buf[0])=
;
> >
> > -	if (send_flags & MSG_OOB) {
> > -		/* Fail reading OOB while in sockmap */
> > -		try_recv("bpf.recv(sd_out, MSG_OOB)", sd_out,
> > -			 MSG_OOB | MSG_DONTWAIT, false);
> > -
> > -		/* Remove sd_out from sockmap */
> > -		xbpf_map_delete_elem(maps->out, &u32(0));
> > -
> > -		/* Check that OOB was dropped on redirect */
> > -		try_recv("recv(sd_out, MSG_OOB)", sd_out,
> > -			 MSG_OOB | MSG_DONTWAIT, false);
> > -
> > -		goto del_in;
> > -	}
>=20
> [Severity: Low]
> With these assertions and the { AF_UNIX, SOCK_STREAM, MSG_OOB } entry
> in test_redir() removed, does any selftest still cover AF_UNIX MSG_OOB
> together with sockmap at this commit?

No test is needed anymore, I'm removing it.


>=20
> The kernel side is still present here. AF_UNIX send(MSG_OOB) still
> works, and unix_stream_bpf_recvmsg() still has the rejection:
>=20
> net/unix/unix_bpf.c:unix_stream_bpf_recvmsg() {
>     ...
> 	if (flags & MSG_OOB)
> 		return -EOPNOTSUPP;

This stays in unix_stream_sendmsg() too, but is not worth testing
itself.



>     ...
> }
>=20
> This seems to be intentional and only lasts until the end of the series.
> After the later patch "af_unix: Remove MSG_OOB.", unix_stream_sendmsg()
> and unix_dgram_sendmsg() return -EOPNOTSUPP for MSG_OOB, and the receive
> paths reject it as well. At that point, the "OOB dropped on redirect"
> behaviour checked here no longer exists, and the removed case would fail
> at send().
>=20
> Removing the test before the feature looks like the right order. This
> note is only about the short coverage gap between the two patches.
>=20
> [ ... ]
>=20
> > @@ -365,12 +345,10 @@ static void test_redir(enum bpf_map_type type, st=
ruct redir_spec *redir,
> >  {
> >  	struct socket_spec *s, sockets[] =3D {
> >  		{ AF_INET, SOCK_STREAM },
> > -		// { AF_INET, SOCK_STREAM, MSG_OOB }, /* Known to be broken */
>=20
> [Severity: Low]
> This isn't a bug, but the commit message only mentions the AF_UNIX case
> and send_flags:
>=20
>   Let's remove the test case from sockmap_redir.
>=20
>   Note that struct socket_spec.send_flags is no longer used so
>   removed too.
>=20
> This line also drops the commented-out TCP MSG_OOB entry and its "Known
> to be broken" note. The entry never ran, and without send_flags it could
> not stay as written: MSG_OOB would land in in[0].
>=20
> Would it be worth mentioning in the commit message that the in-tree note
> about TCP plus sockmap OOB being broken is removed as well?
>=20
> >  		{ AF_INET6, SOCK_STREAM },
> >  		{ AF_INET, SOCK_DGRAM },
> >  		{ AF_INET6, SOCK_DGRAM },
> >  		{ AF_UNIX, SOCK_STREAM },
> > -		{ AF_UNIX, SOCK_STREAM, MSG_OOB },
> >  		{ AF_UNIX, SOCK_DGRAM },
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261116021845.2533130-1-kuniyu%40google.com
