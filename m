Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795484311;
	b=QqopP2jV+UbRU6b1BaVYa7rFGRyvgzQedeTdp8Vu03v9A92dbMLofD2VQNXxkxpWo1Nf
	 YWO+Xv4okQPBZ3Et+9uB8oO/fgWLpYn4tPW7sklSPPGrpqpeLiwhSgK+3kv9IXkXyAmNA
	 8LvDA3VIeYgft47K6zzmXzL2mC+kd9fsiqFX3yxPfnRhe+FarEk84DkpO5rCNkMY2fYOy
	 sRmdpXaK16cJDp4bcQI8eu/unmAgmhcd5o9G90do8BTg4eEUBQIJ7hOnx72INkjzHvjkr
	 hOyF7zcVQQYQC/vTBHl+I6fWYLiBPxEYXDxcHnuEBghvNBd7JPYOKJ8gSuGkwM0s3fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795484311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zPEkjCEVqbn6YbsK/3IOudjnU9MkfzVsn/g6qbuTA7w=;
	b=lHfQ1tg0SvJl55taO/bxEQNXQVWqpr6vnOZ6jhnuFFCb9C6Udr8ZdDpJsD7de7waek6Z
	 mtsXXM/ENrtpao2JJJBdyEo76hrtc89os8R5RQIqfpHBoGWm3NHi6lKD3vrJB91t4CxE5
	 PVaBIU1AmnJx9z0WturxjX+Z9abjIHdGzu6+joagu8tJZVzR5MpOOw3TsiA2XDegB6Dl/
	 skjxEgDkLy8NRKvq9C93HCHJhZDsHgQGO6YU1jvb6E1tOlIqrzHqGHNxEqzQwk8JtwCAg
	 8C6wsVVlcE2zNdqALgEm/+UiXDmEaOAonr2BoDcmhQTISJ3EERjOJs0UTX4MjU40QHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tis7Ks6Y;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2785E606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2785E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tis7Ks6Y
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0dba37a7fso32091847b3.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795484309; x=1796089109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPEkjCEVqbn6YbsK/3IOudjnU9MkfzVsn/g6qbuTA7w=;
        b=Tis7Ks6YH3lIFYhtif3vvVyETTXpbJHyX8WoZh7J60hvENiYqzcvsnVH4Q/df67uGT
         vfpdue3Xzbl7nDk0myzXBlXaxsB4MsIL8BwzD/bQemrz70xqpJA1tNSrpWoyXCQW7Fjo
         sCvjn9DXt241tTDV8VUGDXq/Du6JCtFWkMdBP3u3RapBy7CxMAKK9W9mjSYw7j4LpsY/
         nttToLwinv0jVXq7uDMiVlnxJd92W1SaEiyU1yzpdUUlOR4fxQ20VUM7Z2sW+UiCdv7K
         YXuKRnm+vB2+Ex6QlGOyqhuMV7Z/qnp5bew4recieYpL2EVRC//cuA9SjTwoITtcDcRm
         a0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795484309; x=1796089109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPEkjCEVqbn6YbsK/3IOudjnU9MkfzVsn/g6qbuTA7w=;
        b=ZovxrC5Zm4KpSkCkD0fYU1NnT0PClTLbtVudvTCGZ+0IlCjytbn4HEf6BhT8XHHNlY
         MxD6tvESaiNCthW3EDxxkDqfC8jM68epgEEp2tyoWK+PmzUpD/0uNgZb/5X1bNrYBZFB
         PRWVDX0meFspr1KMqPQDqhV+p8vrRu/EwXHR01HtZXZVF6mDnkZHXdkuhNhxnAvO9h4i
         4qyALZusVLjuT33o9ckggEoDRaSoNiGHh6Iglfxxd6spoOymtAQbr5zCl40pYNxm6Vkc
         qLMqnQJJvPkoqtZ67AURt+ViTq8sTwX0FKmDYdFU0StmhvMS8soXQwWSLpH25OEwsHXe
         LoDg==
X-Gm-Message-State: APuU4Z97lC2KlcIvYP2OFm0qwiRpdVfT9GXpq6u/KWH0xDxLjW3VD7KS
	BqMKZM35E+UtzpCaEsdo9ZJCJ1Jrrt7m9qz06q6xQW5tAiih+y3t/BIhDiTNkK8x
X-Gm-Gg: AZFdTZeawOn9WC6S91Xraz6HqRzq1re4vq0lfHkDtMJBxRWgEWuxFGx+x+OAZikRGoT
	loEwoqiuz/QcBPLG8YZPisH9jfhGlg/bm82hE/sG7RrAWN0StFgqJ30AvQGDsJUkX4c8R2n+q2p
	PwQuqSK7rEB/DEeqtOC0nI07Af5I3C19TKBTXykbws66Wjqx7egL6qy212Y2LHYtYbVNkKkhdr8
	eF3IPgg3GhZlagOdjiQRF9zyKT/DkxcusNO2xqZWg/6Vg1EAErbG3jKY025Ud92RHLxH/mYstoJ
	vPgCffigPiUbC6TIXIFSkvN3OJWp5X1YsJ1CvSKbYAZuVUpABu2ukcRSbgh1k5YOWtUCiDSJAi0
	bPhgK8rHgnKXYlHfp+yLiP04BoYgsMmwEtBRZnFaPy0PHKy+EJ5cPg5tCrb7s+6ZwiKfi4P19zR
	fmQfa2gwqck1I6bn+JQlurqrKHiLL/JXQPFOSwGIRkPMXTW+t2FkXL79VqY304TtjB+9l0wLD/A
	WH1LFy/+ycVpV3RNxNanBIIPkSnluDO6ORSFha1Ea9gos1nvotGoTAoNhnJn+rgp8ANzrHgu3XR
	pZdrpJVzpUFqbx1FOjIm/6zXj/MG7KsyEuVXlC1z3kdOG28Vtsep2+fwx2ccnAIEnYI6NZjY0L2
	yd+tXUywDFie+56PUn88M8tcWzvbZeNttuNsya3iUf0boLBQvuOfRbUcDhzRD+h/nu7DXSMghCC
	yIwkeSrmRmmjIDKssg81KJX/zt
X-Received: by 2002:a05:690e:12cc:b0:679:a943:7da7 with SMTP id 956f58d0204a3-67df447de99mr5037121d50.81.1795484309083;
        Mon, 23 Nov 2026 17:38:29 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:7bd1:1ca0:6d54:522c:b8ac:678d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52036d72csm52271787b3.45.2026.11.23.17.38.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 17:38:28 -0800 (PST)
From: Aviral Srivastava <aviralyash27@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	Aviral Srivastava <aviralyash27@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2] udp: gro: do not match tunnel-processed and plain packets
Date: Mon, 23 Nov 2026 17:38:23 -0800
Message-ID: <20261124013823.96835-1-aviralyash27@gmail.com>
X-Mailer: git-send-email 2.55.0
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

udp_gro_receive_segment() matches an incoming UDP packet against the
held packets using udp_hdr(p), while every other GRO layer compares at
p->data + off. When an inner network header was parsed for p (vxlan,
geneve, or IPIP/SIT/GRE carried over FOU/GUE), the transport header of
p points at the inner L4 header. The port check then compares the ports
of an incoming plain UDP datagram with the inner TCP/UDP ports of the
tunnelled flow, and on a match the datagram is handled as the next
segment of that flow.

This needs both packets in the same GRO bucket with the same outer
addresses (no RX hash, or an equal one), a UDP tunnel GRO socket on the
receiver, and a UDP_GRO socket on the port, rx-udp-gro-forwarding or
rx-gro-list. Plain and tunnelled TCP cannot meet this way, their outer
IP protocols differ.

Since commit e20cf8d3f1f7 ("udp: implement GRO for plain UDP sockets.")
the datagram can be merged into the tunnelled aggregate. On v6.6.162 a
plain datagram with ordinary outer header values (same TTL, TOS and DF
as the vxlan packet) is appended to the inner TCP segment and never
reaches the UDP socket.

Since commit 4b0ebbca3e16 ("net: gro: move L3 flush checks to
tcp_gro_receive and udp_gro_receive_segment")
gro_receive_network_flush() also derives the network header of the
incoming skb from p's offsets (outer network header to inner transport
header: 70 bytes for vxlan over IPv4, more with larger inner headers)
and reads before the incoming skb's network header, out of bounds on
skbs with small headroom:

  BUG: KASAN: slab-out-of-bounds in __gro_receive_network_flush
  Read of size 1 ...
   udp_gro_receive <- udp4_gro_receive <- inet_gro_receive <- dev_gro_receive

The merge then depends on the bytes read there. When it happens with
rx-gro-list and forwarding, the datagram is forwarded as part of the
inner flow's aggregate, so netfilter rules matching the datagram itself
are not applied to it. Without a merge, the wrong comparison still
flushes the tunnelled flow on every such datagram.

When udp_gro_receive_segment() runs, NAPI_GRO_CB()->encap_mark is set
only if an inner network header was parsed for the packet, which is
also the only case where the transport header is past the first UDP
header. FOU and GUE clear encap_mark, but when they carry an L4
protocol directly the transport header and network offsets still
describe the outer headers, the same layer as for plain UDP; when they
carry IPIP, SIT or GRE the inner handler sets it again. Skip held
packets whose encap_mark differs from the incoming packet: both are 0
or both are 1 within one flow, so legitimate aggregation is unchanged.

Found by an AI code review agent (Claude) reviewing the UDP GRO code.
Confirmed with reproducers on unmodified kernels (arm64 QEMU with
KASAN, network namespaces over veth), and the fix was tested there:
- torvalds/master 4843f6873f7c, vxlan, geneve, and FOU/GUE carrying
  IPIP, SIT, GRE and vxlan: KASAN reports on every run before, none
  after; forced merge of 98% of the datagrams before, none after.
- v6.6.162 with this change backported, vxlan and geneve: 2000 of 2000
  datagrams merged before, none after; no KASAN report either way.
- Plain UDP GRO, UDP and TCP in vxlan, UDP in geneve and UDP in
  FOU/GUE + IPIP/GRE still aggregate.
Not tested: x86_64, real NICs, vxlan-gpe.

Fixes: e20cf8d3f1f7 ("udp: implement GRO for plain UDP sockets.")
Fixes: 4b0ebbca3e16 ("net: gro: move L3 flush checks to tcp_gro_receive and udp_gro_receive_segment")
Cc: stable@vger.kernel.org
Signed-off-by: Aviral Srivastava <aviralyash27@gmail.com>
---

Notes:
    v2:
    - Add Fixes: e20cf8d3f1f7 and Cc: stable. The merge without the
      out-of-bounds read is reproduced on v6.6.162 (Sashiko).
    - Reword the comment and changelog on what encap_mark means with
      FOU/GUE. No functional change: FOU/GUE carrying L4 directly keep the
      transport header at the outer UDP header (Sashiko).
    - Changelog: state the preconditions, correct the netfilter sentence
      (the hooks see the aggregate, not the datagram), move discovery and
      testing into the changelog, add geneve, FOU/GUE and v6.6 results.
    - v1 reported "28 and 29" KASAN reports; that was the dmesg ring
      limit. The console logs of those runs hold 1023 and 308 reports.
    v1: https://lore.kernel.org/netdev/20261122183951.73210-1-aviralyash27@gmail.com/
    
    The analysis, reproducers, fix and changelog were drafted with an LLM
    coding assistant (Claude). I reviewed them before sending. Reproducers
    and logs are available on request.

 net/ipv4/udp_offload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
index b77ae2f00c62..a9368a6abde2 100644
--- a/net/ipv4/udp_offload.c
+++ b/net/ipv4/udp_offload.c
@@ -723,6 +723,19 @@ static struct sk_buff *udp_gro_receive_segment(struct list_head *head,
 		if (!NAPI_GRO_CB(p)->same_flow)
 			continue;
 
+		/* encap_mark is set here only if an inner network header
+		 * was parsed (UDP tunnels, IPIP, SIT, GRE, also when carried
+		 * over FOU/GUE). udp_hdr() then points at the inner L4
+		 * header and the network offsets describe the inner packet.
+		 * FOU/GUE carrying an L4 protocol directly clear it and
+		 * leave udp_hdr() at the outer UDP header, as for plain UDP.
+		 * Never match packets across the two cases.
+		 */
+		if (NAPI_GRO_CB(p)->encap_mark != NAPI_GRO_CB(skb)->encap_mark) {
+			NAPI_GRO_CB(p)->same_flow = 0;
+			continue;
+		}
+
 		uh2 = udp_hdr(p);
 
 		/* Match ports only, as csum is always non zero */
-- 
2.55.0

