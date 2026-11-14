Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670809;
	b=zgSPo5URLul5GLmP6pdlvAIOUmysksOKu0gNqau+TAd0qx3SX/EVqEPHakvcK6zii1+N
	 DZ8GOHLg1k+9yBooXt0011HRrp+KyubF3EIq1W/3bm9HJXRNK5C6MwWgutNfkVxRxlV0B
	 W3ugUpVQGWdu/LoAvJlXWF89MjBwBqoiKKr/gcSlSpiUbT+tMqeSN/m/gzC9+NVanfk48
	 VFvwS2ty8H5cr5ORjc5zdTPHQ74VcaBZUmjjdx2lfOCpFofsVUtOzOD9hAMnveOIAIT8I
	 NGBjID0H40PSB1qAqruz3/QAWHLbXqTxtVTcieAiX6TgyLEbtmAYjogmtFr56UHr9NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670809;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tnYhM815kAkVWTzpxnAaWP3mtHVbbYTDMYpaWw91WNk=;
	b=n/9vMmWZOOHATFbRbOrERleYJXDVAPYdQL168HF+7HAHDW/4DBlVqtJdcMYqu7XjU5Un
	 HvYnuss6maqAfBYfaft1G/lGrSGMny/H3MnLxWKozWLANFExW4QDejHf4f1b2anFnRz1A
	 30dLaLvwp2qRYE33Z3TzCIoCICVm7xJyl2gTefmXeWYPF/PrqkkXKcxD2GfdBOU/J0PCc
	 +D6EJjkeArAE7Ydqww619pcu7d+a8Uq6jlwkXI83e8x4OiButwtFCi3rMHhJYadBaSQHP
	 S3OYClxNuXORptvUzyn35PNeBpj20Q+PXMV2eVdoIUbLfoTvmJrqoLdQTgAJRWp954A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="glppZf/F";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378CD606A32E
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=glppZf/F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10461F000C5
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794670808;
	bh=tnYhM815kAkVWTzpxnAaWP3mtHVbbYTDMYpaWw91WNk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=glppZf/FEc2iVzfde9IrEFf7zNuXl25JS7TKafslq9FVHp+DWTY9/ytcuDWGhgW4D
	 2hXSZT+ohwh/RWDuYw+jSa36ClaYx1B5dSlWs1z+NL9QiSTHaaviYWsI39e4G4uKnN
	 VzfYwY63xWb1rRVuOFaRxEL5IbrJc9HSX8t0NZLKQaihsLw8+pL5L2AtFgF8coQE9E
	 AzSyQVaiVKfZUqTKY5DgewC+4iBq0ge93hoCrvxY+1a5o1zfjS+WIVPEQuY2SW5yG5
	 xZYSNJKW8/tU8119eODc5GBUuhSsxo/mx07MhKuTZEn18xxkydVYNWeMBMRV74A+CO
	 87VanVfKe8DVg==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso2091005eaf.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:40:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFSq5h8UxP8xtWHoRVx3gi2GYSRSHl8V6VZX9VcEbZIo1cbOf6U0gpabhIEEvPFKytuS0z3SyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z96Q1CphHHUu95jOOrdkfx8XxCH0SWuSYeYFzOVwJPMVSX8I02L
	TXODiQwaZP8Cdf0gkFx0aXyQVqMd91ru3QQrRma8FUx5HcXbkwLR42PgQd6dpBAhlLopXiSm91Q
	QxG9LOOhxSNCQkME7Tz1oHDxUp+81aq4=
X-Received: by 2002:a05:6820:2206:b0:70a:6888:228f with SMTP id
 006d021491bc7-71ab4cfe52bmr3250514eaf.4.1794670808156; Sat, 14 Nov 2026
 07:40:08 -0800 (PST)
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
In-Reply-To: <20261114040101.1043546-9-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sat, 14 Nov 2026 16:39:57 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqtZELeDDXLhdusHR-KwcAoYyAWPfeJt18gD-9okdVz6w@mail.gmail.com>
X-Gm-Features: AclHuK-11FJuZeY04DFYM-I2dUwIc1g6MSCuV3bmKfTPwzBS_cpqvsyyr7psaTI
Message-ID: <CAL4WiiqtZELeDDXLhdusHR-KwcAoYyAWPfeJt18gD-9okdVz6w@mail.gmail.com>
Subject: Re: [PATCH v1 net-next 8/8] selftest: packetdrill: Add test for tcp_collapse().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 14 nov. 2026 =C3=A0 05:01, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> tcp_collapse() now does not collapse high-density skbs and a
> low-density skb sandwitched by hihg-density skbs.
>

s/sandwitched/sandwiched/
s/hihg/high/


> tcp_collapse.pkt verifies the behaviour by
>
> 1. set a large SO_RCVBUF
> 2. send one high-density skb with 100 bytes read()
> 3. send one high-density skb
> 4. send one low-density skb
> 5. send one high-density skb
> 6. send 30 low-density skbs
> 7. set a small SO_RCVBUF
> 8. send a small data to trigger tcp_collapse()
> 9. check TcpExtTCPRcvCollapsed via nstat
>
> Without the series, the first high-density skb is collapsed.
> In addition, the first low-density skb drags the following
> high-density skb into collapsing, consuming more memory.
>
> If we remove sk_forced_mem_schedule() without this series,
> sk->sk_forwad_alloc becomes negative at the end of tcp_collapse().

s/sk_forwad_alloc/sk_forward_alloc/

>
> Note that 30 segments are to make the memory savings large
> enough so that the margin can absorb minor size delta of
> struct sk_buff or L1_CACHE_BYTES across configs.
>
> skb truesize, TCP_COLLAPSE_MAX_SIZE, TCP_COLLAPSE_SCALING_RATIO
> depend on PAGE_SIZE being 4K, so the test is skipped if getconf
> returns non-4K PAGE_SIZE.
>
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> ---
>  .../selftests/net/packetdrill/ksft_runner.sh  |   9 ++
>  .../net/packetdrill/tcp_collapse.pkt          | 135 ++++++++++++++++++
>  2 files changed, 144 insertions(+)
>  create mode 100644 tools/testing/selftests/net/packetdrill/tcp_collapse.=
pkt
>
> diff --git a/tools/testing/selftests/net/packetdrill/ksft_runner.sh b/too=
ls/testing/selftests/net/packetdrill/ksft_runner.sh
> index 0a97d5ae3469..250d143bb9f7 100755
> --- a/tools/testing/selftests/net/packetdrill/ksft_runner.sh
> +++ b/tools/testing/selftests/net/packetdrill/ksft_runner.sh
> @@ -44,6 +44,15 @@ if [ -z "$(which packetdrill)" ]; then
>         exit "$KSFT_SKIP"
>  fi
>
> +page_size=3D$(grep -E '^--define=3D"?PAGE_SIZE=3D' $script | sed -E 's/.=
*PAGE_SIZE=3D"?([0-9]+)"?.*/\1/')
> +if [[ -n "$page_size" ]]; then
> +       cur_page_size=3D$(getconf PAGESIZE 2>/dev/null)
> +       if [[ "$cur_page_size" !=3D "$page_size" ]]; then
> +               ktap_skip_all "requires PAGE_SIZE=3D$page_size (current: =
${cur_page_size:-unknown})"
> +               exit "$KSFT_SKIP"
> +       fi
> +fi
> +
>  declare -a optargs
>  failfunc=3Dktap_test_fail
>
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_collapse.pkt b/t=
ools/testing/selftests/net/packetdrill/tcp_collapse.pkt
> new file mode 100644
> index 000000000000..90e8be86968f
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_collapse.pkt
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Test that tcp_collapse() only collapses bloated skb runs, skips leadi=
ng
> +// and trailing high-density skbs, skips isolated bloated skbs when coll=
apsing
> +// them would not shrink truesize, and properly recovers receive buffer =
space.
> +
> +--mss=3D1000
> +--define=3D"PAGE_SIZE=3D4096"
> +
> +`./defaults.sh`
> +
> +// Establish a connection with a large receive buffer.
> +// __sock_set_rcvbuf() doubles, so 2000000
> +   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
> +   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [1000000], 4) =3D 0
> +   +0 bind(3, ..., ...) =3D 0
> +   +0 listen(3, 1) =3D 0
> +
> +   +0 < S 0:0(0) win 32792 <mss 1000,nop,nop,sackOK,nop,wscale 7>
> +   +0 > S. 0:0(0) ack 1 win 65535 <mss 1460,nop,nop,sackOK,nop,wscale 4>
> +   +0 < . 1:1(0) ack 1 win 65535
> +
> +   +0 accept(3, ..., ...) =3D 4
> +
> +// 1. Queue two high-density 62,000 B segments (each adds 15 pages of fr=
ag
> +// truesize with enough margin across NET_SKB_PAD, L1_CACHE_BYTES, and
> +// MAX_SKB_FRAGS configs).
> +// Read 100 bytes from the first one so before(skb->seq, tp->copied_seq)=
 is true.
> +   +0 < P. 1:62001(62000) ack 1 win 65535
> +    * > .  1:1(0) ack 62001
> +   +0 read(4, ..., 100) =3D 100
> +
> +   +0 < P. 62001:124001(62000) ack 1 win 65535
> +    * > .  1:1(0) ack 124001
> +
> +// 2. Queue an isolated bloated 1,000 B segment.
> +   +0 < P. 124001:125001(1000) ack 1 win 65535
> +    * > .  1:1(0) ack 125001
> +
> +// 3. Queue another high-density 62,000 B segment.
> +   +0 < P. 125001:187001(62000) ack 1 win 65535
> +    * > .  1:1(0) ack 187001
> +
> +// 4. Queue a run of 30 bloated 1,000 B segments.

This test only covers the receive queue.

Most of the new logic in patch 3 is about the out-of-order queue
(overlapping skbs, monotonic seq/end_seq in the rbtree), and nothing
exercises it: before this series, TcpExtTCPRcvCollapsed stays at zero
for the whole packetdrill TCP suite.

I have a test collapsing the out-of-order queue (segments sent in
decreasing sequence order so that they are not coalesced when
queued), it passes on top of your series. I can send it after your
v2, or you can add something similar here.
