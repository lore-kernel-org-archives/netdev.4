Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572287;
	b=L1YF5PHE09fwOgD358PO1jcneEraTfXcYEzbKxO8HzV9GQBaMHk8XK1AuuAGsKHZmls0
	 Rty0wEOuBOSbEaMpOVmJpa9wJVJSGKDDDG7ZQXDaKS4twnWEyUt2l5a3Jejb/qxH4ogOU
	 n9ny1Ah8i3eJznzh2kdzIkW8rpTQlJzQbEM4KIUE8In7hj0QnVS8fTa2uaAJbgrBf5yxW
	 39JGhWtTwiJdYoXvnTreW25ScnljVI+bEYtlKNdqVp4kHVUX18vLbqMKVn9faZ0MJv1EG
	 QtxU4AE4bJTloWinxvKMghW4a3k2pqZ+3Ch57PyAspRn9qFLBDp4m0zR4U1/aTvs9Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r1FsHPY/eEdw9lmKwC0RcgLAYBSGm8vaNvCwPZbTmSE=;
	b=k95sPm4S3z0ohIUdp5YPu63aaUHIPmpgcB2jVLfcAQxSngmfAlo7gbFGXE8O5Mh4d73A
	 3NFuzj6rThSILrhRkqugCNCnUldcJz/VN5fKHhV6iySMKRuO3ull3IO4QghcVLP/eIk7o
	 nj4sFbk4UGdgya/+jiR8q7BZNxPXUfBZlxm6FdBY7BHMi+YwJmHJadPAYiqgzJ5WYkuCE
	 HzThKIePYZyG0eX4tBgTCSX+M046UswgX1VFzxzUOQ7i0GTajB7rsaTXb0oQ37lqcgcHb
	 2bVZ4nekJXOSPvFb/0xOKuQvxeEiVeZn5664yciO6P4J3E8uALE3KPV7IbGEBGN1ykA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgTGEXWC;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D17606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34D17606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgTGEXWC
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f045b921caso29547005ad.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795572286; x=1796177086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1FsHPY/eEdw9lmKwC0RcgLAYBSGm8vaNvCwPZbTmSE=;
        b=pgTGEXWCFRapnrRBgfjvorxW89rPGVjcp8OIaC+zN0o0gEd/bbF/3Xd6Ory9sVpPe7
         l0+8zoFI508IZFB+S034nOqYxzho8RfAme68+mCrnDq/fo3Gv/HmzhO5HUnPjOSbRxyb
         25OpIKucxjidTi9c0p66vsWtRIYzyrqst8ZuEEfliV/pwkW/s78HsneuVc1DFEv0S1gq
         j3/W/fn8wMbQaPXO2gGmzNE0sBAvd96TIiRnUC9+r90IFcU+tgFFOJ2IKRDGbYxxAwxg
         iwbcn849TK786FiLpo3eyUBwDDt4dPT/smb4lJdA0bXeLhWK6fHTnssnlUPmdyx9psCw
         ReDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795572286; x=1796177086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1FsHPY/eEdw9lmKwC0RcgLAYBSGm8vaNvCwPZbTmSE=;
        b=p563cJNZ3H7ayvXIjVA0j7v0uvsBH9/tDVeu1t6ehS4hNeEMU9fGd1wgsq417xOWd7
         eic8y7tYh8AnbBvmLAos0mGTj6ivClexaUWjX3bJoRgTE8HGc2M+kI57IKy4y7rYHsr5
         kXf/+vOKETLEVLrlwcJSd8keXZLg3nGKFBTkVyTedLAb0NwLDBZMKVH3A6wVH1yEc0XE
         iXv1b2yL4iPV/NtfNPJ77mPKD3/MDLCEUk8TZx391ZT1NGLbaSUQnnwPfXhVr+C2I2xq
         RePYDmvVIGobJiAMYfR3fyVQ/a3FAkczkraPFYAstx+xJcX69untqrRKIzYaDtvXtaBU
         y0VA==
X-Forwarded-Encrypted: i=1; AL+hErFBgxhkXGCSx9l6Ty7RE+wVLm+PZVJtVAecufzCSBmdsF2PwnmkgbZ70dGH62+slNhyWmPWqGs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YznZoAQh3aDOU0vjgQf7eJ+v+R1k8XadJq3ACIt3DP4ebDgxC
	uMHjE1gt1KqxIFfGI19P9sjKo3u5wyG7yNDw/OoSJzEQUGqgPF+vsl8OFZaMtwxh
X-Gm-Gg: AZFdTZe1pwW9UdfKreieowSwQmhmBaYZu7At3fd1GqwjAn4LcJFWg1jQNB9u1SHez0v
	3mIly2gXFySD95KChmskoC3rM+lZoxdc4swOya3S0Batvg5Id8NFPGdD8Jioew0Jk/ElcH31Bm4
	dQatWTOgbmhv+RdQfY3peGWoASu9sYu8S970NLcK8+3RCQkIOo1GaxHgAEHVExEioPYlCFFKleU
	7ZtZAYsm4RCeQ9BB2JG6+vzlpF9KV1yUvTW/cQdj/QIM5RF37YS3ifi9HXWh4WVHYqGw2Ruxyue
	zdYkYu+BmM0ziDWhd9TZgmavaLY61eymtyh2eFln4bAryUblpNzse40E2CWyDqvjrqyunUGzWQv
	X3aeXBETsDcA+8Pk3mfstt0Is6GiTbKA/Boq3VdHlzcntL3CA601z2mAqu+cx4r9U4E841GlmDC
	JKSDrySAi1lRoksKMZEtXL9QxQF2qyCF04FgslX88ObbiOVHZJl9T8uAlsBH/Gv115+uYB2DQuS
	F0gdxkD3rjtx1BeBVLQT9s8I/7VS8R1Jpz/PWfQahEguVoTAZeiJmtJWgCK91dv9AJ95pu96xsI
	Pa+Z8PTrhVzA9QqnW6bDt0X0mCIe//i+TTG5yqxpd/1bNO0aKtnFfzIAg978N/ChzkE=
X-Received: by 2002:a17:903:f83:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2f03f1d09e3mr157160895ad.59.1795572286497;
        Tue, 24 Nov 2026 18:04:46 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0bc695f31sm19489175ad.49.2026.11.24.18.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:04:46 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>
Cc: Xin Long <lucien.xin@gmail.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org
Subject: [PATCH net] ip6_gre: return the full header length from ip6gre_header()
Date: Wed, 25 Nov 2026 11:04:42 +0900
Message-ID: <179553307366.1670514.6802805102726706751@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 76cc0d3282d4 ("ip6_gre: skb_push ipv6hdr before packing
the header in ip6gre_header"), ip6gre_header() pushes the outer IPv6
header and the GRE header, t->hlen + sizeof(struct ipv6hdr) bytes, but
it still returns t->hlen. packet_snd() copies the user's payload at the
offset dev_hard_header() returns, so an AF_PACKET SOCK_DGRAM send on an
ip6gre device with header_ops (remote any) writes the payload over the
outer IPv6 header and leaves the last 40 bytes of the packet
uninitialized. A packet tap on the device then copies those bytes to
user space:

  BUG: KMSAN: kernel-infoleak in _copy_to_iter (lib/iov_iter.c:197)
   _copy_to_iter (lib/iov_iter.c:197)
   __skb_datagram_iter (net/core/datagram.c:402)
   packet_recvmsg (net/packet/af_packet.c:3573)
   sock_recvmsg (net/socket.c:1176)
   __sys_recvfrom (net/socket.c:2333)
  Uninit was created at:
   __alloc_skb (net/core/skbuff.c:716)
   alloc_skb_with_frags (net/core/skbuff.c:6940)
   sock_alloc_send_pskb (net/core/sock.c:3096)
   packet_sendmsg (net/packet/af_packet.c:3023 af_packet.c:3209)
  Bytes 68-107 of 108 are uninitialized

Return the length that was pushed, as ipgre_header() does. With the
payload in place, the tap also shows that ip6gre_header() never sets
payload_len, so set it as well.

Fixes: 76cc0d3282d4 ("ip6_gre: skb_push ipv6hdr before packing the header in ip6gre_header")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. A reproducer, which runs as any
user; ip6gre-tap sends 64 bytes of 0xaa through an AF_PACKET SOCK_DGRAM
socket and prints the first 48 bytes that a packet tap on the device
sees:

$ cat ip6gre-tap.c
#include <arpa/inet.h>
#include <linux/if_packet.h>
#include <net/ethernet.h>
#include <net/if.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>

/* send 64 bytes of 0xaa through argv[1] and print what a tap on it sees */
int main(int argc, char **argv)
{
	unsigned char sa[offsetof(struct sockaddr_ll, sll_addr) + 16] = {};
	struct sockaddr_ll *dst = (void *)sa, tap = { .sll_family = AF_PACKET };
	unsigned char payload[64], buf[256];
	int c = socket(AF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
	int s = socket(AF_PACKET, SOCK_DGRAM, htons(ETH_P_IPV6));
	int n;

	tap.sll_protocol = htons(ETH_P_ALL);
	tap.sll_ifindex = if_nametoindex(argv[1]);
	bind(c, (void *)&tap, sizeof(tap));

	dst->sll_family = AF_PACKET;
	dst->sll_protocol = htons(ETH_P_IPV6);
	dst->sll_ifindex = tap.sll_ifindex;
	dst->sll_halen = 16;
	inet_pton(AF_INET6, "2001:db8::2", sa + offsetof(struct sockaddr_ll, sll_addr));
	memset(payload, 0xaa, sizeof(payload));
	sendto(s, payload, sizeof(payload), 0, (void *)sa, sizeof(sa));

	n = recv(c, buf, sizeof(buf), 0);
	printf("%d bytes:", n);
	for (int i = 0; i < 48; i++)
		printf(" %02x", buf[i]);
	printf("\n");
	return 0;
}
$ unshare -Urn sh -e <<'END'
ip link add g6 type ip6gre local 2001:db8::1
ip link set g6 up
./ip6gre-tap g6
END

Without the patch the outer IPv6 header is 0xaa from byte 4 on and
KMSAN reports the infoleak above. With it:

108 bytes: 60 0c f6 22 00 44 2f 40 20 01 0d b8 00 00 00 00 00 00 00 00
00 00 00 01 20 01 0d b8 00 00 00 00 00 00 00 00 00 00 00 02 00 00 86 dd
aa aa aa aa

The patch was written with LLM assistance; we reviewed and tested it.

 net/ipv6/ip6_gre.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index b5d6ed8f0c36..9b30fb2f4bcf 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -1397,6 +1397,7 @@ static int ip6gre_header(struct sk_buff *skb, struct net_device *dev,
 	ip6_flow_hdr(ipv6h, 0, ip6_make_flowlabel(dev_net(dev), skb,
 						  t->fl.u.ip6.flowlabel,
 						  true, &t->fl.u.ip6));
+	ipv6h->payload_len = htons(t->hlen + len);
 	ipv6h->hop_limit = t->parms.hop_limit;
 	ipv6h->nexthdr = NEXTHDR_GRE;
 	ipv6h->saddr = t->parms.laddr;
@@ -1415,9 +1416,9 @@ static int ip6gre_header(struct sk_buff *skb, struct net_device *dev,
 	if (daddr)
 		memcpy(&ipv6h->daddr, daddr, sizeof(struct in6_addr));
 	if (!ipv6_addr_any(&ipv6h->daddr))
-		return t->hlen;
+		return needed;
 
-	return -t->hlen;
+	return -needed;
 }
 
 static const struct header_ops ip6gre_header_ops = {
-- 
2.43.0

