Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022148;
	b=uYSVVsCepsb1p1lle5RC7EghGWfD2YR4WW3vlMJLCwmevisXauA3fNxYwjQK/kp3T1B0
	 55NWtNZZ95vN1aC/RivRx1v+0qrfimElYcPJA7b+sDcP0Segjih/8DNElkKgkdWi109/m
	 Z5CwFQaajS4DQdCQq/TZ9UDGZMPT0fwwWzUJ7zlaZT3TampheMXz72XqIV2mQiyVop85q
	 PbQ8Czka8edbaqsDZfT/TZ8Nr4mVwHNqalPoMlIKLRANNB2+cOYpJ6fO7eZ3mDtuie0ws
	 ICI2fY3ZnEH8b3/FqIOIlg5ZPd//+UwRNA+kWkpkLVB75ipwpIDJG/EsKnBz6nUrYVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022148;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=y1HQ4WbkwsYDU9C8N67zbQb8VxPifqOw6NSzlc1e1o4=;
	b=zkHhrUIN2idbs9dS3PpRid+yYHliHJq5fUDwSAH3IHC91s95zD3Vczv+XWJwZ2g+pzr7
	 oftQjmBC0IpO/xagzC+nxn7sGLQl8fJYyw58aFClAMu8ZwD9e94Gc7MjX6TtW2vtZXZ5P
	 D5bQeXe+pHwIOeJkfgYRp9g54Lot66Oqia1fbs05+dgP/ReOmY+md5nbJ6xiVObA3VCsi
	 YkOhAKEx/wWBY6TUObxAhsO4tSJMxlWuNbRc05/Z8H5RTBQ+YV1LAiKpIKrTtp1W9XISf
	 X+VmuoGTZJVQGqADgEfElvf6LILO0KK+FmMCzMMZ1CTWSFbEmzB/sh2F8mh1og/ilHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WpCu6JJN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82F9606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WpCu6JJN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65041F000C4
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795022147;
	bh=y1HQ4WbkwsYDU9C8N67zbQb8VxPifqOw6NSzlc1e1o4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WpCu6JJNYdW5/+jjULJDCYglNCXydsIJNx8hI7jpXxSeAe8oXwC3OagfaZ06yn/1A
	 VDWTvZyEaAmeQuc+u0XV+MrYDiMz9eJJ3zUm8TMUYnhuVGjUo46iKb1CduGayvxOX8
	 eto1gq7PaNe5bqyucCLvY5p7KiC9OWEFKWEBlAl/5UEz91ht82jdNtJQmrFGtHldDh
	 XwTuqIUuU//hR8+dzupxVhRUeadJ9XnfdfYHxW48kAPowS2lbJHS2/F05Fe8HVJ0cK
	 IekRQlcIcRDvZKhxrjtEz/QQZUfEkGJN+//8K9UYtG5TZ6pAr/CkHqPeNhn9PB4j09
	 bM9dIYoih/rOw==
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-716c0217635so43595eaf.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:15:47 -0800 (PST)
X-Gm-Message-State: APuU4Z9DKE+6FZ9BtAycne4wvYEp+kU/ECZ6ZGdlt4Ha5SaBI9MZbxpv
	KKGjk3AduPk5jm1SXqt00sRDfjCmq+bIWB1bsrEMn0R5wPQyIfgwvBmqPqdxNuGBgmut5wzTs1I
	pVJoSsvHCyzhOVq/SxNehYcE1ri2BSrg=
X-Received: by 2002:a05:6820:5712:10b0:71a:fcbf:2484 with SMTP id
 006d021491bc7-71b2a536c4fmr59343eaf.36.1795022147087; Wed, 18 Nov 2026
 09:15:47 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116015732.2744688-1-jiebin.sun@intel.com>
In-Reply-To: <20261116015732.2744688-1-jiebin.sun@intel.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 18:15:36 +0100
X-Gmail-Original-Message-ID: <CAL4Wiio=6iUnMQM1Ry+fda3Y2Y3=d13_g42e5ZHhXHDmhp7eFA@mail.gmail.com>
X-Gm-Features: AclHuK-drbUSgy2492OTPn4_aGO4otO_DPLYCBGNsvJCoOpkSZnVkAHlnvN9vlw
Message-ID: <CAL4Wiio=6iUnMQM1Ry+fda3Y2Y3=d13_g42e5ZHhXHDmhp7eFA@mail.gmail.com>
Subject: Re: [PATCH] net: dst: Avoid false sharing between tclassid and __rcuref
To: Jiebin Sun <jiebin.sun@intel.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, linux-kernel@vger.kernel.org, 
	tim.c.chen@linux.intel.com, tianyou.li@intel.com, wangyang.guo@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 16 nov. 2026 =C3=A0 02:53, Jiebin Sun <jiebin.sun@intel.com> a =C3=
=A9crit :
>
> On x86-64, dst_entry::tclassid shares the same cache line with
> dst_entry::__rcuref. Updates to __rcuref cause false sharing with
> tclassid reads, for example in ip_rcv_finish_core() when
> CONFIG_IP_ROUTE_CLASSID=3Dy. Memcached perf c2c shows the paths:
>
>   read:    net_rx_action -> process_backlog -> ip_rcv_finish_core
>            -> skb_dst(skb)->tclassid (load)
>   acquire: tcp_write_xmit -> __tcp_transmit_skb -> __dev_queue_xmit
>            -> skb_dst_force -> dst_hold_safe -> rcuref_get
>   release: tcp_rcv_established/tcp_add_backlog -> tcp_cleanup_skb
>            -> skb_dst_drop -> dst_release -> rcuref_put
>
> Move tclassid after lwtstate on 64-bit to avoid false sharing with
> __rcuref.
>
> On x86-64, struct dst_entry grows from 136 to 144 bytes. struct
> rtable and struct rt6_info embed dst_entry, so their sizes grow
> from 176 to 184 and from 224 to 232 bytes, respectively. However,
> both struct rtable and struct rt6_info are allocated from slab
> caches with SLAB_HWCACHE_ALIGN, so the per-object allocation sizes
> remain unchanged at 192 bytes for rtable and 256 bytes for rt6_info.
>


This leaves a 4-byte hole where tclassid was, and adds 4 bytes of
padding at the end of dst_entry.

As the AI review pointed out, struct metadata_dst is not allocated
from a HWCACHE_ALIGN cache. Its union is 16-byte aligned, so it grows
from 240 to 256 bytes, and metadata_dst_alloc() with any optslen > 0
(vxlan collect_md, geneve options) moves from kmalloc-256 to
kmalloc-512, for every received packet.

I do not think we need to grow dst_entry at all.

dst->expires sits in the first (read-mostly) cache line, but its
fast path readers are all conditional (rt->rt_pmtu for IPv4,
RTF_EXPIRES for IPv6). It can live in the __rcuref cache line.

Swapping it with {error, __pad, tclassid} keeps sizeof(struct dst_entry)
at 136 bytes, keeps __rcuref at offset 64 on both 32-bit and 64-bit
without any new #ifdef, and also moves dst->error out of the
contended cache line.

Something like this (untested):

diff --git a/include/net/dst.h b/include/net/dst.h
--- a/include/net/dst.h
+++ b/include/net/dst.h
@@ -31,7 +31,9 @@ struct dst_entry {
        };
        struct  dst_ops         *ops;
        unsigned long           _metrics;
-       unsigned long           expires;
+       short                   error;
+       short                   __pad;
+       __u32                   tclassid;
 #ifdef CONFIG_XFRM
        struct xfrm_state       *xfrm;
 #else
@@ -74,9 +76,7 @@ struct dst_entry {
        int                     __use;
        unsigned long           lastuse;
        struct rcu_head         rcu_head;
-       short                   error;
-       short                   __pad;
-       __u32                   tclassid;
+       unsigned long           expires;
 #ifndef CONFIG_64BIT
        struct lwtunnel_state   *lwtstate;
        rcuref_t                __rcuref;       /* 32-bit offset 64 */

Could you test this with your memcached setup, and include
pahole output for dst_entry and metadata_dst in the changelog?

> Memcached perf c2c samples at the class-ID load:
>
>   +----------+------------+-------------+
>   | Kernel   | Local HITM | Remote HITM |
>   +----------+------------+-------------+
>   | Baseline |        894 |         680 |
>   | Patched  |         15 |           0 |
>   +----------+------------+-------------+
>
> Results with 64 workers per endpoint (baseline 6628e7d4c6b2).
> Improvement is 100 * (patched average / baseline average - 1).
>
> Memcached (5 iterations, average operations/s):
>
>   +--------------------+--------------------+
>   | Case               | Improvement (%)    |
>   +--------------------+--------------------+
>   | default            |             +27.20 |
>   | hit                |             +52.36 |
>   | balanced           |              -0.52 |
>   | large              |             +64.68 |
>   +--------------------+--------------------+
>
> Memcached over IPv4 loopback.

Please make clear in the changelog that this is a loopback workload.
__rcuref is written for every packet there because loopback does not
set IFF_XMIT_DST_RELEASE, so __dev_queue_xmit() calls skb_dst_force()
and the receive path reuses the same dst. This is not what happens
with a physical NIC.

> The default client command is:
>
>   memtier_benchmark -s 127.0.0.1 -p 11221 -P memcache_text
>     -t 64 -c 1 --pipeline=3D16 --test-time=3D60 --ratio=3D1:100
>     --data-size=3D32 --key-maximum=3D10000000
>
>   hit:              --key-maximum=3D1000
>   balanced:         --key-maximum=3D1000 --ratio=3D1:1
>   large:            --key-maximum=3D1000 --data-size=3D1024
>
> TCP request/reply (5 iterations, average transactions/s):
>
>   +----------------------+--------------------+
>   | Case                 | Improvement (%)    |
>   +----------------------+--------------------+
>   | tcp4-rr              |              +1.85 |
>   | ipv6-loopback-plain  |              -0.60 |
>   | ipv6-loopback-expiry |              -0.24 |
>   | tcp6-rr              |              -1.60 |
>   +----------------------+--------------------+
>
> 64 pinned netperf clients per case, with 128-byte requests and
> replies:
>
>   tcp4-rr:              netperf -t TCP_RR -l 8 -- -r 128,128
>   ipv6-loopback-plain:  netperf -6 -t TCP_RR -l 8 -- -r 128,128
>   ipv6-loopback-expiry: netperf -6 -t TCP_RR -l 8 -- -r 128,128
>   tcp6-rr:              netperf -6 -t TCP_RR -l 30 -- -r 128,128
>
> Transfer (5 iterations, average received Mbit/s):

These tables are all within noise and do not exercise the contended
path. Please remove them, the changelog would be much easier to read
with only the perf c2c data and the memcached numbers.

Also, please tag the next version for net-next.

Thanks.

pw-bot: cr


>
>   +-------------+--------------------+
>   | Case        | Improvement (%)    |
>   +-------------+--------------------+
>   | udp4-small  |              -0.91 |
>   | udp4-frag   |              +0.41 |
>   | tcp4-stream |              +0.92 |
>   | udp6-small  |              -0.81 |
>   | udp6-frag   |              +1.37 |
>   | tcp6-stream |              +3.22 |
>   | udpxfrm     |              +4.57 |
>   | tcpxfrm     |              -1.23 |
>   | geneve0     |              +0.49 |
>   | geneve8     |              +4.28 |
>   | geneve32    |              +1.53 |
>   +-------------+--------------------+
>
> 64 pinned netperf clients per case. Netperf commands:
>
>   udp4-small:  netperf -t UDP_STREAM -l 30 -- -m 512
>   udp4-frag:   netperf -t UDP_STREAM -l 8 -- -m 8K
>   tcp4-stream: netperf -t TCP_STREAM -l 8 -- -m 10K
>   udp6-small:  netperf -6 -t UDP_STREAM -l 8 -- -m 512
>   udp6-frag:   netperf -6 -t UDP_STREAM -l 8 -- -m 8K
>   tcp6-stream: netperf -6 -t TCP_STREAM -l 8 -- -m 10K
>   udpxfrm:     netperf -t UDP_STREAM -l 8 -- -m 8K
>   tcpxfrm:     netperf -t TCP_STREAM -l 8 -- -m 10K
>   geneve0:     netperf -t TCP_STREAM -l 8 -- -m 10K
>   geneve8:     netperf -t TCP_STREAM -l 8 -- -m 10K
>   geneve32:    netperf -t TCP_STREAM -l 30 -- -m 10K
>
> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
> Reviewed-by: Tianyou Li <tianyou.li@intel.com>
> Reviewed-by: Wangyang Guo <wangyang.guo@intel.com>
> Signed-off-by: Jiebin Sun <jiebin.sun@intel.com>
> ---
>  include/net/dst.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/include/net/dst.h b/include/net/dst.h
> index dbedfe72e1fd..f01cfb42f97c 100644
> --- a/include/net/dst.h
> +++ b/include/net/dst.h
> @@ -76,17 +76,17 @@ struct dst_entry {
>         struct rcu_head         rcu_head;
>         short                   error;
>         short                   __pad;
> -       __u32                   tclassid;
>  #ifndef CONFIG_64BIT
> +       __u32                   tclassid;
>         struct lwtunnel_state   *lwtstate;
>         rcuref_t                __rcuref;       /* 32-bit offset 64 */
>  #endif
>         netdevice_tracker       dev_tracker;
>
>         /*
> -        * Used by rtable and rt6_info. Moves lwtstate into the next cach=
e
> -        * line on 64bit so that lwtstate does not cause false sharing wi=
th
> -        * __rcuref under contention of __rcuref. This also puts the
> +        * Used by rtable and rt6_info. Moves lwtstate and tclassid into =
the
> +        * next cache line on 64bit so that they do not cause false shari=
ng
> +        * with __rcuref under contention of __rcuref. This also puts the
>          * frequently accessed members of rtable and rt6_info out of the
>          * __rcuref cache line.
>          */
> @@ -94,6 +94,7 @@ struct dst_entry {
>         struct uncached_list    *rt_uncached_list;
>  #ifdef CONFIG_64BIT
>         struct lwtunnel_state   *lwtstate;
> +       __u32                   tclassid;
>  #endif
>  };
>
> --
> 2.52.0
>
