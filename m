Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794673267;
	b=kBeC2McyFfTSffHZ+cSJ4efKX/JY+zVQBWoVgndlEfBDBcLSpKh1MwXEyDZLoOef/RZU
	 8nxHBVUkeypCuCLl66KiUjLF4r8Bpt3Molw41dTkocMZifAbBSUDcgAo9LeE285k8ajUE
	 /76kE5yQnLJJ2XAMCTBtbpiN40Q31P+7v/L8ZaGvpzegb5QYSePiwJHgkQ4/xmaeHxE0y
	 yoprmTE/OlZ6a9QgZ+U6lFV/TTdwDXNzRq1xJ8IL8OWIZS7/fmEmefl3OrO4ZlvIjcXYi
	 GcckmA1P6oudV7X6aWtET+nqXpzU9St/lqwLJrCmzjPBppAKg0KuglVwit6URvCXaDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zmXhC1u42BkZMZStvLaYXPuWC2IKwRSUsbPvZjHHB+w=;
	b=rlC6svJn8EqI/QR4QJ6IAm/08htcnTqFucN06oNdMY7yBu6yrfQYKSpVQhsmWsHIi8kI
	 N7dThZjWqZvGU7eNu0O6AEI6sSn4VC2Y0kQKwW4bZss8K5Dmi9Bz7P7zVvRFDat75Y3/l
	 Ps0ObFadAgWHekR6GfjsI3xT/946Ax7aAA5o0aZesmhT5BXUGODbSRtCLi4K+bKuGOlQ6
	 DbTc4BNwN9d9sEIJ+P6apP95gUnfJPc4/Ui5YSdDCLWtt9O7MgwZgLCQVULtEw84pLhXe
	 xU0Yz0V+uiIZowx8c96tXTieqlcOyoq9AmcAuMtZd6U4FYn7ddoEG0FH0HjIVi1QefA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kE5zSJBU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E29B606A33A
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E29B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kE5zSJBU
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so2752029c88.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:21:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794673266; cv=none;
        d=google.com; s=arc-20260327;
        b=fXVzOFjW10fZ9i4UWEiZvVIhXeSJto5wc9lqv/GqjP1prKu4LGE+/N6+rEtaMD+Edl
         SbheotpyIoVGEoPqBRJJhjDIKNOeKkYfnGnZoMBcp/h940ItcyQ10L2QrPmTkpXQI+oP
         SBRFpub8K0qjcyRoKlKTesc+bAHRTj0w0+jMT/gLkOJJHWR+houZDcpGkW9CXWsf10kW
         9XPVjEixaSCONvrym9nMlCaZ1dqQ7AuaqK3Pd68MNh2l6+Yb5aBNj466R6ZPNAS+x7u1
         ZVb/cq5infu+TxJiqZNFdkzhBpCnQhpeLiZnoeDWs5SJTB8JrZP0ZIR+JqcQwZP4cZtE
         aH/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zmXhC1u42BkZMZStvLaYXPuWC2IKwRSUsbPvZjHHB+w=;
        fh=W10MNpY7/saHPc/cDhsy7PsmVyOsAXXDN01ul+NknWQ=;
        b=WodoAeQYT4V7mR/gCH1iNzcpFvXjQ9OmHR40UW4eN9pSFj9APeGtKUgBU0TweqxMjx
         YgkVeDtcnfN4QbVU2s4d2IqyCzBkaVGVMcOqlvMhF/xXkhiDuZQ2G2JgQyjt97ab1DGT
         ek3upvQDblPY7OgJhTheHcJbEqM9IXATcPcjU7yt9L/r4NhGgdXqGPoWr55PhGPokPzC
         uSPIlBHW8AtHqs7EmsyBTe4mYBtrB0DSVP9QllKXWomDeycWaqAKxZDY0kZ6w4IcPY3t
         k6QnKRN/vbJM/LBMAHvFxM93SErwl3/KmShkwGFMSIXP0osAn2UAjhEcoUQod/YpvM9K
         EmqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794673266; x=1795278066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zmXhC1u42BkZMZStvLaYXPuWC2IKwRSUsbPvZjHHB+w=;
        b=kE5zSJBU3pGk0TKfsuoUHoCqAXHVhrjYs99hjcB4BNqI+xE0G1wlfhtOyHCT98ulIf
         sd8QQ4wlw0QbDIU7Lu0TaT9O+zlwe6rFfK7S1nW7igEkGyi5boJLNSAFAVgb/xCXLFG+
         niHKLgKAj+M9OOc42naQ9PsY5n/vJPL2XVaAyAXUVc74AvLMny6YyYQ6bdMZUMMXeO0i
         DNPYpsLinHbn/BUo8mgYql3a8/p1xOpbKM2r/odV2GoM3cb/CHxiiEsSVv2BdYVG86qy
         6zZ/7zJcAGZwx+UmGIH9l6tSfOs/8K0v+yI8rxIQwGhoqTsLvc6FSFq8Zf1Z4Ub2FgHI
         jPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673266; x=1795278066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmXhC1u42BkZMZStvLaYXPuWC2IKwRSUsbPvZjHHB+w=;
        b=mKmWPPIDz7u0L3M8Rb8+2KLdhmn8gaXmDuxCSsQAU3sVUkQCvDkmOHH6D8HdVY143d
         7MTCL2R67eoGLUuO1yZTM5lF/ZHeOIcXYUGf1yJ3dFPco+iOrYgNHmvRCkTIdUtLW1W6
         12PBtS+54lZmc7uwiukyLaXQ+zgXqiK6tMHu03VlOdsThsQ/4o9xXCi/Emm7usLYGLe5
         QJivSUQXSDD5UbNOGT2sB1OSYbjVPFCmWiL9s5N4o5LpFyP2/TiDV7N4vK0bc4TB3Cah
         p2B9pxTrxB8+eAboKCqqE369LUJsIz0Q4+fi1/x8r7+hV3Ht/9bSltmQahgklQXZce0z
         GT1w==
X-Forwarded-Encrypted: i=1; AL+hErFALukqbkxwBpRA0MAozGoWEnJav2LGDUNXump7GhMiiM2nykVp1Fu0yKH1frDwpfvUWBhAtQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TlHCQJtC8spj9KWxE70Gi1aNdGJDkeHdULguRniAlIs3lNC4l
	Zknw+5S5P1vmKXn4cROyFtpcI5HGmCt7yV80KtKniOs6wBCzLLbOCs63pQJfpB0G66VVoNN9gBH
	PnfCmZgjwDKlDYbSE4xlipWhYeIjv7CfTrCLVwI4JnDCcwXCttjrTK/rXxx8=
X-Gm-Gg: AYBFou1QvWL60QLZ9BrpWhvizvjnJSz3MUSkKxsCviGc7APpByiydbw9F2WdEW3yhiP
	vARVQh3Ig0RZQ6qu6tDvSkw5D9x3MOCWApPOkUWYiM+86SBE1cxEfnhRDdapEOBrIPcPWZvg1RS
	+Uua3QK9TQuZeoE4gar86aM0K0YRuaRIjuM6gpXg5te2bgU42420rTmhxpKP11vujeU/ATveRxA
	ROWOSqcQUneuzYcvyW1b+ab/Jv0UeZiBHfu614SFvYmXYU7Wr65/hglCyCSkloN3VSwLpl0qVlb
	BTLoI+jXmbZWlXjinY34n+ojF5z5WHew36PyWXQSwFmRburDBnGQN7xYF/E0N330Bva/iZ0dTVW
	SEYlrRN2V81zrcLY5CbyfsCimScM/ar+8kokjNPB2JNLOk8iW0rwuoEbxJYTFy66nCRRmz7yp0+
	28FNidwavs1nN/zduUsZz0lZa3coixvszwenshDmhlRs/HErZBMxL0vBDC9TicggATO7KC6Y9rb
	iBYnyvkow==
X-Received: by 2002:a05:7023:a42:b0:1af:16c4:d06b with SMTP id
 a92af1059eb24-1b5030a3490mr5078016c88.10.1794673264243; Sat, 14 Nov 2026
 08:21:04 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114040101.1043546-1-kuniyu@google.com> <20261114040101.1043546-9-kuniyu@google.com>
 <CAL4WiiqtZELeDDXLhdusHR-KwcAoYyAWPfeJt18gD-9okdVz6w@mail.gmail.com>
In-Reply-To: <CAL4WiiqtZELeDDXLhdusHR-KwcAoYyAWPfeJt18gD-9okdVz6w@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 14 Nov 2026 08:20:53 -0800
X-Gm-Features: AclHuK9F-8b2aKTBen_lU3pQk7vLu3duNjR-P5ojXjoS0dgSmkbMviIuYars7Zs
Message-ID: <CAAVpQUCVkrdXdnP9pYa805Z48--K=bVKiM+Fbu5D+Fth7fE5XQ@mail.gmail.com>
Subject: Re: [PATCH v1 net-next 8/8] selftest: packetdrill: Add test for tcp_collapse().
To: Eric Dumazet <edumazet@kernel.org>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 7:40=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> Le sam. 14 nov. 2026 =C3=A0 05:01, Kuniyuki Iwashima <kuniyu@google.com> =
a =C3=A9crit :
> >
> > tcp_collapse() now does not collapse high-density skbs and a
> > low-density skb sandwitched by hihg-density skbs.
> >
>
> s/sandwitched/sandwiched/
> s/hihg/high/

oops, will update.

>
>
> > tcp_collapse.pkt verifies the behaviour by
> >
> > 1. set a large SO_RCVBUF
> > 2. send one high-density skb with 100 bytes read()
> > 3. send one high-density skb
> > 4. send one low-density skb
> > 5. send one high-density skb
> > 6. send 30 low-density skbs
> > 7. set a small SO_RCVBUF
> > 8. send a small data to trigger tcp_collapse()
> > 9. check TcpExtTCPRcvCollapsed via nstat
> >
> > Without the series, the first high-density skb is collapsed.
> > In addition, the first low-density skb drags the following
> > high-density skb into collapsing, consuming more memory.
> >
> > If we remove sk_forced_mem_schedule() without this series,
> > sk->sk_forwad_alloc becomes negative at the end of tcp_collapse().
>
> s/sk_forwad_alloc/sk_forward_alloc/

will update.

>
> >
> > Note that 30 segments are to make the memory savings large
> > enough so that the margin can absorb minor size delta of
> > struct sk_buff or L1_CACHE_BYTES across configs.
> >
> > skb truesize, TCP_COLLAPSE_MAX_SIZE, TCP_COLLAPSE_SCALING_RATIO
> > depend on PAGE_SIZE being 4K, so the test is skipped if getconf
> > returns non-4K PAGE_SIZE.
> >
> > Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> > ---
> >  .../selftests/net/packetdrill/ksft_runner.sh  |   9 ++
> >  .../net/packetdrill/tcp_collapse.pkt          | 135 ++++++++++++++++++
> >  2 files changed, 144 insertions(+)
> >  create mode 100644 tools/testing/selftests/net/packetdrill/tcp_collaps=
e.pkt
> >
> > diff --git a/tools/testing/selftests/net/packetdrill/ksft_runner.sh b/t=
ools/testing/selftests/net/packetdrill/ksft_runner.sh
> > index 0a97d5ae3469..250d143bb9f7 100755
> > --- a/tools/testing/selftests/net/packetdrill/ksft_runner.sh
> > +++ b/tools/testing/selftests/net/packetdrill/ksft_runner.sh
> > @@ -44,6 +44,15 @@ if [ -z "$(which packetdrill)" ]; then
> >         exit "$KSFT_SKIP"
> >  fi
> >
> > +page_size=3D$(grep -E '^--define=3D"?PAGE_SIZE=3D' $script | sed -E 's=
/.*PAGE_SIZE=3D"?([0-9]+)"?.*/\1/')
> > +if [[ -n "$page_size" ]]; then
> > +       cur_page_size=3D$(getconf PAGESIZE 2>/dev/null)
> > +       if [[ "$cur_page_size" !=3D "$page_size" ]]; then
> > +               ktap_skip_all "requires PAGE_SIZE=3D$page_size (current=
: ${cur_page_size:-unknown})"
> > +               exit "$KSFT_SKIP"
> > +       fi
> > +fi
> > +
> >  declare -a optargs
> >  failfunc=3Dktap_test_fail
> >
> > diff --git a/tools/testing/selftests/net/packetdrill/tcp_collapse.pkt b=
/tools/testing/selftests/net/packetdrill/tcp_collapse.pkt
> > new file mode 100644
> > index 000000000000..90e8be86968f
> > --- /dev/null
> > +++ b/tools/testing/selftests/net/packetdrill/tcp_collapse.pkt
> > @@ -0,0 +1,135 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Test that tcp_collapse() only collapses bloated skb runs, skips lea=
ding
> > +// and trailing high-density skbs, skips isolated bloated skbs when co=
llapsing
> > +// them would not shrink truesize, and properly recovers receive buffe=
r space.
> > +
> > +--mss=3D1000
> > +--define=3D"PAGE_SIZE=3D4096"
> > +
> > +`./defaults.sh`
> > +
> > +// Establish a connection with a large receive buffer.
> > +// __sock_set_rcvbuf() doubles, so 2000000
> > +   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> > +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
> > +   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [1000000], 4) =3D 0
> > +   +0 bind(3, ..., ...) =3D 0
> > +   +0 listen(3, 1) =3D 0
> > +
> > +   +0 < S 0:0(0) win 32792 <mss 1000,nop,nop,sackOK,nop,wscale 7>
> > +   +0 > S. 0:0(0) ack 1 win 65535 <mss 1460,nop,nop,sackOK,nop,wscale =
4>
> > +   +0 < . 1:1(0) ack 1 win 65535
> > +
> > +   +0 accept(3, ..., ...) =3D 4
> > +
> > +// 1. Queue two high-density 62,000 B segments (each adds 15 pages of =
frag
> > +// truesize with enough margin across NET_SKB_PAD, L1_CACHE_BYTES, and
> > +// MAX_SKB_FRAGS configs).
> > +// Read 100 bytes from the first one so before(skb->seq, tp->copied_se=
q) is true.
> > +   +0 < P. 1:62001(62000) ack 1 win 65535
> > +    * > .  1:1(0) ack 62001
> > +   +0 read(4, ..., 100) =3D 100
> > +
> > +   +0 < P. 62001:124001(62000) ack 1 win 65535
> > +    * > .  1:1(0) ack 124001
> > +
> > +// 2. Queue an isolated bloated 1,000 B segment.
> > +   +0 < P. 124001:125001(1000) ack 1 win 65535
> > +    * > .  1:1(0) ack 125001
> > +
> > +// 3. Queue another high-density 62,000 B segment.
> > +   +0 < P. 125001:187001(62000) ack 1 win 65535
> > +    * > .  1:1(0) ack 187001
> > +
> > +// 4. Queue a run of 30 bloated 1,000 B segments.
>
> This test only covers the receive queue.
>
> Most of the new logic in patch 3 is about the out-of-order queue
> (overlapping skbs, monotonic seq/end_seq in the rbtree), and nothing
> exercises it: before this series, TcpExtTCPRcvCollapsed stays at zero
> for the whole packetdrill TCP suite.

Yes, indeed.

>
> I have a test collapsing the out-of-order queue (segments sent in
> decreasing sequence order so that they are not coalesced when
> queued), it passes on top of your series. I can send it after your
> v2, or you can add something similar here.

Thank you for the new test !

I'd avoid duplicating it and wait for your test.
