Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926188;
	b=DbCCEtLJVaE1uXM22/9F49P2UtIz8gbwUmIwS8DcIDDXIwPGHTfFTpkmM3XFywDAf10d
	 M5Gw51FswaoctMNjQyok5NTUn9idtB0MQSooOfk8vneWhTxchJfi2FgNpQIuWtISSpcBF
	 X3qkOAynr39HfVEiLFB1drKkyITGYWFkdQtSrZ7v+Kog9BQmJgUrICP34LtDHpQyCgdg0
	 RZkFvyTwdZj4kdBQGqxu+HDenTt/MndIZ0LR2A7N3yh4iLmw3HR9LIHq9NDv/+c4EqbEl
	 3A+lDNG2kOQ0DSU1vsa+9hVn6Z8OjXW+nsglw613rsCBEFsg7eAvMksMJATdL1Cx2wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QtUm7TvC7GRJNtLS1kOdX7J2AtRJGnOgnIYw+uuwMDM=;
	b=1R7chqqUfCRqymRhfN9RwrCmzZ9O/8vdF5QvsugQvjOndwecCFvTS9t1Q2wqzSnb7mM7
	 2H/SoBGn8kD25ybh0GKOwOxehdWheoiTxaak/yMqEhxw7BkkmonxIYikf68VZBWPNP4Sx
	 BRrwP/sf685FlXBM/5I1SXjqRgxNhhz3j2NPJ2wsD5FgUGS807WmTOS+lg+vMlXTMKbIO
	 sal75AgiE+G/IQOmWtpgQ99MyD+f7sz/xhATO4B7xpnP6tTa5nq4kPDuxp2McEYBpqbpg
	 66rFyhUiz5J3Wv93kt/8VbnPohuXRpzf4ayFkI8y0zEx/nFmDlfqB5f0EaH/SXcWssQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=fEpMRwKl;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DC6606ABA4
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0DC6606ABA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=fEpMRwKl
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b179528d56so2324559a91.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 06:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794926185; x=1795530985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QtUm7TvC7GRJNtLS1kOdX7J2AtRJGnOgnIYw+uuwMDM=;
        b=fEpMRwKl5EVyL83pjUEyX8fs3SDJp9a0RiTAclznU4E+o69h/mT+PtiVqtfqt5Hhk7
         l/dJUADH9c6wlZ2BqFgN5261VmN/5Q0WEoogqWeEh/qtin7WwiLwbDHGer3wa6YbNs31
         f77ifaw6ILQ3Uhn+9H63ouFFZT5N9oTTO5DT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926185; x=1795530985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtUm7TvC7GRJNtLS1kOdX7J2AtRJGnOgnIYw+uuwMDM=;
        b=tWkVuSzSks5ypTrXIwM3SjfEFmimcSq7aOtJUMeI54bK9CEtRg0oWad5dIXnuxZzn9
         6+pLL8bHvJYiN2CT3KNBcZ7XgGGUyvIj3oTWikUSGLetZ5RAln2MNxxnMi+XoT+LHKHx
         lwt2ViEr4XXs9H+ivY6a3ifp6Y3mx8LMP9Kq+cH2k541EKzpivaitGbCd34GULGZR98M
         MpeEz3KBZfT/GWF+I1r68GDLilN6b+4ANVp1hJdYmy09wrbTQ7Jt6ybaM2rfIoPf2rlF
         xSj1bRMdMWAzfw8Cv76ZE3hd6FgrbTp0ou4OSvQ4kiq9xdzQFDp915odjlCkuWw5A1a4
         y8eg==
X-Forwarded-Encrypted: i=1; AL+hErFAXF+Ehow/rsDV9J5awZ7mDUbsWV7VdcjjVm2Mazf1Zep0iM0cMW8eQ2fNGrCmtip5+ot7PBI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1qNY6+gE1/oFIuBskEsJYupW5eXGkdXqpPgvF7ckT4QP5vOt5
	cdtSDUjjBls/ir/kWSH87wRzGVL3vNFtTRAkiMxO7v1rJDNyz2MONGi8c7aoKYSkldk=
X-Gm-Gg: AZFdTZeC9Vmd+u4y4aA9CVo3Dc96eBIuAQv5FrvRXsMFiwmlRYBTlAdoFqS4FTeq9W/
	c/ColzztFoLaYAjouUMYxlTOoI70TMgk0fmtvA6mEmQJhETAAjGoeQlGEEkeRmaOk+faaZeaSD6
	P8tXKdilSO5NIdThg2P2kxROIYHfMayWNUlm9OHZPQ6qVW2EtpZk5QlFOtH53pueFKT+KehemgK
	HywfKdRq8q5eTUspBLWALkidLPAFodYwBlYvpfPUdRRmg7LcpzJg/OYuPGUX/gN5SFoWb2AlLgK
	sjBfhoBBNXiYjzFQibYlCyw8Ci1MJLkoiZJ7efDmUFYwdztQoQhB5Jm0YnpMubMmD9xntr3t6tx
	TiBHSeeTmkON0engH8FoNkAQQwjx+rxYorPmmhhI7hiyM7el9eua1/d56qjy4WCXLMZIedKppMi
	1gw5TcnFsBTPK5EUC7yCNhUxnk2wpzXaaiaDDxxNxVzIfCe0DBdki8Iyr4E2qSzXNrUttREuO59
	M6dCElcEECgIM3xSKXynr85P6Lhz7hYiR0PwPNSDXhLXV7gxmLHSuCTWG/ovlQFjuFsvMlj85Jj
	pRw1hM+YZOW/YUuXnd2Ufz7trdZHNB0+WWZPSqV/hWC9ciSoIQN4mgFtiMTCL3791ZgPJRtwqAD
	uIadYsxKWSSRte4t++ZSrT0fo4noVnpZ/QzsD+85kpE1F7EwpFpcEwRc6nltBWK4u
X-Received: by 2002:a17:90b:37d0:b0:3ac:aa8d:19eb with SMTP id 98e67ed59e1d1-3b1b07e9b1amr13858047a91.3.1794926185112;
        Tue, 17 Nov 2026 06:36:25 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4cff6fsm4414174a91.12.2026.11.17.06.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:36:24 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Eric Dumazet <edumazet@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andrea Mayer <andrea.mayer@uniroma2.it>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net v3] net: clear skb->mac_len in skb_unset_mac_header()
Date: Tue, 17 Nov 2026 20:06:12 +0530
Message-Id: <20261117143612.95112-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

From: Eric Dumazet <edumazet@kernel.org>

skb_unset_mac_header() marks the mac header as unset but leaves
skb->mac_len alone, so an skb can end up with no mac header and a
non-zero mac_len. Code that uses mac_len to decide whether a mac
header is present is then misled.

end_dt_vrf_rcv() (SRv6 End.DT4/End.DT6) unsets the mac header of the
decapsulated packet so that the VRF device can rebuild it. The VRF
device only does so when a packet sniffer is attached, so without one
the skb continues up the stack with mac_len == 14. In
xfrm4_remove_tunnel_encap() and xfrm6_remove_tunnel_encap(),
skb_mac_header_rebuild() is a no-op for such an skb, and the following

        if (skb->mac_len)
                eth_hdr(skb)->h_proto = skb->protocol;

writes two bytes at skb->head + 0xffff + offsetof(struct ethhdr, h_proto):

  BUG: KASAN: slab-out-of-bounds in xfrm4_remove_tunnel_encap+0x17d/0x220
  Write of size 2 at addr ffff88805f85800b by task syz-executor/10831
   xfrm4_remove_tunnel_encap
   xfrm_input
   xfrm4_esp_rcv
   ip_protocol_deliver_rcu
   ip_local_deliver_finish
   seg6_local_input_core
   lwtunnel_input
   __netif_receive_skb
   netif_receive_skb
   tun_rx_batched
   tun_get_user

__input_process_payload() in net/xfrm/xfrm_iptfs.c has the same three
lines and reported as a use-after-free rather than an out-of-bounds. The
address written is fixed relative to skb->head, so what it lands in is
whatever the allocator placed sixteen pages past the skb: a live object
gives slab-out-of-bounds, a freed one or a page back on the buddy free
list gives use-after-free, and a different live object gives no report at
all. Clearing mac_len at the source makes the guard false at all three
sites.

Clear mac_len in skb_unset_mac_header() so that all callers leave the
skb in a consistent state, and remove the now redundant assignment in
skb_carve_reset_headers(). The other callers are on egress paths
(__bpf_redirect_neigh(), bpf_lwt_push_ip_encap()) or only reach the
helper when the mac header was already unset (bpf_update_srh_state()),
and do not read mac_len afterwards. vrf_prepare_mac_header(), the rebuild
end_dt_vrf_rcv() unsets the header for, pushes ETH_HLEN and then calls
skb_reset_mac_header() and skb_reset_mac_len(), so it recomputes mac_len
itself and never reads the stale value.

The issue was reported on the list by Piyus Kedia and Kapil Vaswani,
who found it by fuzzing with AI assistance and reproduced the KASAN
splat on v7.4-rc3. Their reproducer was not published.

Fixes: 664d6f86868b ("seg6: add support for the SRv6 End.DT4 behavior")
Reported-by: Piyus Kedia <piyus@iiitd.ac.in>
Reported-by: Kapil Vaswani <kapil@presceralabs.ai>
Closes: https://lore.kernel.org/netdev/20261116174531.2540348-2-piyus@iiitd.ac.in/
Suggested-by: Kapil Vaswani <kapil@presceralabs.ai>
Suggested-by: Piyus Kedia <piyus@iiitd.ac.in>
Tested-by: Piyus Kedia <piyus@iiitd.ac.in>
Signed-off-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
v3: use the generic fix Eric suggested - clear mac_len where it is left
    stale, instead of guarding each place that reads it. v1 and v2 added a
    skb_mac_header_was_set() test at each reader. Authorship is Eric's.

v1: https://lore.kernel.org/r/20261116174531.2540348-2-piyus@iiitd.ac.in

 include/linux/skbuff.h | 1 +
 net/core/skbuff.c      | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 6787fcf6ac3e..9cd8eff0309c 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -3186,6 +3186,7 @@ static inline u32 skb_mac_header_len(const struct sk_buff *skb)
 static inline void skb_unset_mac_header(struct sk_buff *skb)
 {
 	skb->mac_header = (typeof(skb->mac_header))~0U;
+	skb->mac_len = 0;
 }
 
 static inline void skb_reset_mac_header(struct sk_buff *skb)
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 1ac1e327ac4c..8fe0938d6131 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6984,7 +6984,6 @@ static void skb_carve_reset_headers(struct sk_buff *skb)
 	skb_unset_mac_header(skb);
 	skb_unset_transport_header(skb);
 	skb_reset_network_header(skb);
-	skb->mac_len = 0;
 
 	/* Inner offsets have no "unset" marker, zero them so that
 	 * skb_inner_network_header_was_set() becomes false and no
