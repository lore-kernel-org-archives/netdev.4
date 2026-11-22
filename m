Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372796;
	b=SNwCtETOWOC0EWT6WGw1qupBMoaAFarpJktsQ+lnOt+cnOKUu5UqaUS5LrbDbHfhKH66
	 9ZUYdtUfffvoL4Et0CxO6hrHgEzs10UA1WslAJFsfLFE//iEGs4ITFA3F8rNOmmlHtT+v
	 QUjPpTKUEf2C39SFPCgWmKVmem289AS/8AfooD5HYkW2dAHhGkI3qzBMRT1lWbCUz5EN6
	 LPNm6EqmrnvdQWCLgzVFAoAfIbX72k/lApJ8Sgt/vGewoNtHl4Ic5XOjaecOgAqyMR/vU
	 V23XhdeKxYFAEjuMZt6vbumSZ67rhlmjqB342jdYT/jofK9Zm/Z4CKw2RvvthpOZGmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NFuxsbUQMzttLSs2UQ8ZBFMe4/JhB5qsHLDUQ6VJNhE=;
	b=HOuLBfJwa5AH02Nv+GJ60R99aDXY+BSuxUnr5DRHSxGYMCv96zoWGRXybu6/hm/dMp/e
	 mjW2Le33OPKuKDZg142HTbNnnGJCRleYsdOOH70Bx4DHKfiP5k9f3lo5P8smdi3lJbam/
	 4XBtztGbSEnwAM2bP9+kxpsVjkqVk9pXxRXxFmGYntX5JiA614tjwD6C+eqlxOUS5R2IR
	 SfZRS5CyOsGYH3HxhNCKobxm2bOJ0UBIu9kMnVY2vGG5QMjZHIsHb6RFpYy3iNSLu16bF
	 ka3mfwOMS7e74VW8qGi7tjWYgHjlk7TS+R/4QzUKgNvEVl2m3ZHwo8lO9HiAYw2AuWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwoe3QNB;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1B9606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 18:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F1B9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwoe3QNB
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67dabd38cdfso2920787d50.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 10:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795372795; x=1795977595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NFuxsbUQMzttLSs2UQ8ZBFMe4/JhB5qsHLDUQ6VJNhE=;
        b=lwoe3QNB007cJ2XR+rPw+D3yAPyfqN+wL7FmazJH86DC0CStDhVyrLc+vvnFPskMXd
         x7ZdibXiP1fPHXoJP+K5YmzI8wzkFxBj8tphydmBwbsvauVtegN74CetJiCyp4HZ47/q
         4vlnuURtIdlzUH43+EyKyQl5XKeZq0svbY4cIu4E08hhAC67Wl9sS3hE+MnNzpseI9JE
         t58K2KR2H45nuYm5rnxNQvLA2yJuTc8HVFdxhn4kzfHuOOHnLQu098zyvd3NGM3wHixV
         IJ2ECKJSv5Io69Q1WZ/pn/OAbfz8f381R+pSejUIV9FlRB0aWrnckPv9tYhMAc3d+Xca
         kS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372795; x=1795977595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFuxsbUQMzttLSs2UQ8ZBFMe4/JhB5qsHLDUQ6VJNhE=;
        b=eL10erjJy3+cCpzXkySJS6c9XP0VZhiQJBG2Arrckj3kdlrLTYodoio+KcIIyQiDtB
         gTver8FfH1X2W82tE8p9H5Vi5q1w8+hb73R20SR3nNyHzO53vWxt2+uXT7mmDSeRjlCh
         2IR11h9vJg+cyTnQuZfvbjRCqOaoNBbjS4k/yQygDC1k+gqJhnnkdfzxEyNS9fFFJ8hP
         G/KisruFnNcWY4uwXkPSbemQfmXMG5OPGYX3W7hVaqvrjVI9spHJath0oE/fp0F6YYNP
         Yc+9tBxe9ryw6cVz99HxV91S/iifZY8fjfOogyPcCli38k+aZZQ04tfL9tkP38JBMYhn
         uZrw==
X-Gm-Message-State: APuU4Z/VN418CzeF54i+XhxU3k4OzdkuQ56CK0GcKseSY49Cb+cVnKXo
	+1h+s7UGTtvM+GSswOFkAsCdNGaHnTYzvrmHmAJtEBXFRaoOj+D6ac5Hfhw2c6ES
X-Gm-Gg: AZFdTZfjGa1+1YeeLZKXE3wzyfTwPWMxxripn8DUpohK3AD+0RzSxEkMdRf7J5cY9Jp
	cUKYQeqkv3tDyBRSPNDGH8LgyXsR9dAW4zburBpw8bhQBcnjJWRfcn4xLQHE0qm37PpQeUk0zv7
	YEW/ly34AWVmt5l5Yga6XToFUmwaQO0Y+z5bgqPOitgmvMlIxXLAmJgfBJmpY4itnDTtfzCjeUp
	QdLx6E1onryLi2CzLrrTQBKMs5s51m2UbWc93H84vcsPrEOezCcCvNSEP2BhbVYZEAbdNm/jLqZ
	0w8tjzG8dA80bXImXZel5Nga9iWW3GASENtkQAn9+Z1JFKzW+KYyjLi57yhJK1juj5E5L2qoh/f
	JQl5rdKPGFkt+Y5Wpf39D7kMMHe2WdMAQuEPNteCfFKjTCa2+VBCFfcPe8S8XZSE3O/wraHxFPF
	EdGlgq87Tpx3fzj7oZmGhsjxz+pZkNDX/2ab26MGrJe1GmT9B72Nr7vCYT9yBGjw0HxvlldxJkK
	S5UfCoiB/49AppDCrNw2on6TCFRyzRSWFZyE37nkeTKiSwqaSjH5Uim5j2+OgS0kX3umfyZHjWE
	YtIwVz9AGBmSABTQo+UKtckhRZWWqbcNo+qi6p5bx3cePMzZUrKlYdDQWGj5tx4hpf3+xdJnUWe
	+Uag6BLKp4tao5EVfHMm2BImKcDr4HCKGQGypq70vwU+EwRDXdaNtWvthgZsxtRquMbzKEXx4Ry
	98qY+UT7DT1v2vuHrX3Q9BDMIG
X-Received: by 2002:a05:690c:6b81:b0:8b4:d0a3:dd64 with SMTP id 00721157ae682-8b520456d74mr34797547b3.12.1795372795182;
        Sun, 22 Nov 2026 10:39:55 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:7bd1:1ca0:6d54:522c:b8ac:678d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202cb0b0sm37807017b3.23.2026.11.22.10.39.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 10:39:54 -0800 (PST)
From: Aviral Srivastava <aviralyash27@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	Aviral Srivastava <aviralyash27@gmail.com>
Subject: [PATCH net] udp: gro: do not match tunnel-processed and plain packets
Date: Sun, 22 Nov 2026 10:39:51 -0800
Message-ID: <20261122183951.73210-1-aviralyash27@gmail.com>
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
held packets using udp_hdr(p). When p went through a UDP tunnel GRO
handler (vxlan, geneve), its transport header points at the inner L4
header, so the port check compares the incoming UDP ports with the
inner TCP/UDP ports of the tunnelled flow. gro_receive_network_flush()
then derives the network header of the incoming skb from p's offsets
(outer network header to inner transport header, 70 bytes or more for
vxlan) and reads before the incoming skb's network header, past its
head on small-headroom skbs.

A remote sender can trigger this on a host with a vxlan or geneve
socket plus a UDP_GRO socket, rx-udp-gro-forwarding or rx-gro-list by
sending a vxlan-encapsulated TCP segment followed by a plain UDP
datagram whose ports equal the inner TCP ports. Reproduced with KASAN
on arm64 QEMU over veth:

  BUG: KASAN: slab-out-of-bounds in __gro_receive_network_flush
  Read of size 1 ...
   udp_gro_receive <- udp4_gro_receive <- inet_gro_receive <- dev_gro_receive

When the bytes read happen to match, the UDP payload is merged into the
tunnelled TCP aggregate. With rx-gro-list and forwarding the datagram
is then segmented and sent out with the inner flow's addresses, without
having been seen by the forward or egress netfilter hooks.

NAPI_GRO_CB()->encap_mark records whether a packet has been through a
tunnel GRO handler. Skip held packets whose encap_mark differs from the
incoming packet: both are 0 for plain UDP aggregation and both are 1
for UDP inside a tunnel, so legitimate aggregation is unchanged.

Fixes: 4b0ebbca3e16 ("net: gro: move L3 flush checks to tcp_gro_receive and udp_gro_receive_segment")
Signed-off-by: Aviral Srivastava <aviralyash27@gmail.com>
---

Notes:
    How this patch was made: the bug was found and the fix drafted with an
    LLM coding assistant (Claude) during a review of the UDP GRO code. I
    reviewed the analysis and the change before sending.
    
    Testing (arm64 QEMU, KASAN, two netns over veth, torvalds/master
    4843f6873f7c, unpatched vs patched; netdev/net has no change to these
    files since then):
    - KASAN slab-out-of-bounds in __gro_receive_network_flush: 28 and 29
      reports in two trigger variants before, 0 and 0 after.
    - Forced UDP-into-TCP merge: 97.6% of datagrams merged before, 0 after.
    - rx-gro-list forwarding: 1995 datagrams sent out under the inner flow's
      addresses before, 0 after.
    - Regression: plain UDP GRO, UDP-in-vxlan and TCP-in-vxlan traffic still
      aggregate (recvmsg calls / frames within a few percent of unpatched).
    Not tested: x86_64, real NIC hardware, an IPv6 outer header (IPv6
    UDP GRO shares udp_gro_receive_segment(), so the fix covers it).
    On virtio_net the comparison runs but the out-of-bounds read lands
    in rx headroom, so KASAN stays silent.
    Reproducer available on request.

 net/ipv4/udp_offload.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
index b77ae2f00c62..160b60005a1b 100644
--- a/net/ipv4/udp_offload.c
+++ b/net/ipv4/udp_offload.c
@@ -723,6 +723,17 @@ static struct sk_buff *udp_gro_receive_segment(struct list_head *head,
 		if (!NAPI_GRO_CB(p)->same_flow)
 			continue;
 
+		/* encap_mark is set once a packet has been through a tunnel
+		 * GRO handler (vxlan, geneve, ...). For such a packet
+		 * udp_hdr() points at the inner L4 header and its network
+		 * offsets describe the inner packet, so it must not be
+		 * compared with a packet that has not been through one.
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

