Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607226;
	b=LkMEcpsK5ZssnB3vHYzUVIv2tCkm5qAZEaaqTIQV1+N9z45R9QcpYSmPE+A6ttoOa7tJ
	 qXX/wHm4w/+gpQGTbtfM0axoNFJ3y5CyUVxRvD0NlluaX0zaW4xARV3TPaYL7q3Lnq0Qa
	 KmHX9h9vZQz/ZAc1+XY6yOwVt000t7nLoxpD+7W0crDb3m+Ge31W1c/h9qTpPf/wXAdec
	 UIJ28HZgfPwsW8aDALoq+UeTx65bbBoZmT4b8ld2oPiWF8eJ+BCoYqIsY4YuHYmis9WvD
	 LZl4N2fjidgntEPi1ZnzkMKzb6ghBtU7bE8Xx9fX2PH1AyJh8ddg1NfHUz1+TR1AJJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=/3mgGMHhza/5KNXDvgAxFvs7UNn7OxOqEIGWtGQ5RHo=;
	b=aEw/eYNBeAojLf2WsUFMLnFVF9L86FskFrem/fxrn6sQULleTyfIHk8hT2j5fgcNxx/m
	 Ntq82tm+4NHD5rcz6/bMFNF66lKV1e3pzSQc+K2VNrnwblUtoxjRY7G0WN5IHnt2ZX09Q
	 syrdTEfqTaWpMD8UF6AwqOORVEbAjgI5HuYdbnGvPVFOyS49kVgufxNN8YZCuy0rmKOe1
	 mV2Y61hTClJRdXtFbyDnYACXZdrv/hJ8oH+30D3OSn/CsGm7UeQGO6BJER41MHmL6HMmV
	 2HW7Y7A+uovgdUPiwfqfgiMXydmME/SMXedU4ONw0fmEzfAevicZAzku/fFet7qrUOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=certik.com;
	spf=pass smtp.mailfrom=certik.com;
	dkim=pass header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b="Juq/PAz5";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD534606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD534606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=certik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=certik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=Juq/PAz5
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4d5e645d1so36317607b3.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:47:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795607224; cv=none;
        d=google.com; s=arc-20260327;
        b=WKxc2QTwL4En308LW6fPCYKmB7PYNMuhA83EoisTnVA5fxZTjVwGMHqIf5dxoCmpiX
         k9CcgNW1TxdRrdFYOJwbuDmf66Xdx/FCrObcNl4S3Ne8mroF6Lo95t2optu41XUcsYCV
         R1Mc3xFjrqGrOtZGlXzWv0OqfGxWgVz2t3bKfoB1++vnPa7LW7SkQSZyXNnyCdrknKpH
         wJMJ24fFq+I0t6+JtQ55ChKPQxpX868ETxOpsVQjagR5OwoaHExximBZVfGop8YQ5FD/
         yg5eRfKL6Bs1So6MFzbou5iyTNsicATG2iMNl5TxbXRuUAFborsEJBvFfArqkKWJIc3Q
         TWyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/3mgGMHhza/5KNXDvgAxFvs7UNn7OxOqEIGWtGQ5RHo=;
        fh=gs5/n9cn7UiAZb1K3BC/zxusG3GOpn0fAPK/p54Ys8U=;
        b=kuhp0pxWVv3QLLdX7vHvmL9Wws2nYnCo1Zn8x3Adi1o5Tc6+LN5Ibo5NJD9iJ/JZLb
         xcC46wMPtuac2VhK7cUUN2FhtSmohsh/eRBOYQoLUCC5uTRUj+IJiRX2BDXE/qldg0n9
         dxHunqsH7wXgM8OiA615rO6WmcMPbW1GXV1nBm4qR+cGz38b4NcfJoewNRadMA09v/1X
         WQ8NzJCFzDSJwQHkmoptYyVd2EmKnHYemcR/0NFIceuXu5HB4X2KDtmBKiixyHV7/Q89
         lnIeU0u5YrfQ0LRxZHXy5Oow7vUlEL1+t0SlwWfsYI32aIoR9uBlJ8V2mWkXdZWkxwSZ
         wg9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=certik.com; s=google; t=1795607224; x=1796212024; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/3mgGMHhza/5KNXDvgAxFvs7UNn7OxOqEIGWtGQ5RHo=;
        b=Juq/PAz52kwMKpi3vUExPtY/PTVgBnXp3KpFWlM5jrnHvi9vGp/em/pTCkZZVoltKb
         LVZfkbzqbxTRYGP9zpeBBwifdwt2fiMxh7S6SX99uHnL12irRHwUI+ECx7FT+BHeNbhM
         GTXBuHuiKhc2NjbC5gaipADB1x1hBIFwBO1T8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607224; x=1796212024;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/3mgGMHhza/5KNXDvgAxFvs7UNn7OxOqEIGWtGQ5RHo=;
        b=gmnO6lzJru1Ev0ao3Ail/eOyzq4HBiFJKLYhxhHmNhkhOxs9qdvru2/LSzYlDsL2Pe
         HLLY9Wl0c/YxEdVLWUcVvC+NdDiX2KYZZq0ekAkyu80vt6Srfbl2fB70Hw94RxDL5V1S
         kbTn1GbM5+lAD8zKZXQ+IPJlTNXPs51qBy7cAAbU9wkATdcbTUic6iTwcQ/xILmgCFeU
         sOeHogPbyi7DYc59Fq3H2Gut1ZHt896E5EAhoGGx+lH+WICCvKs0W4Git5/l/SLxQGea
         QWAcDPL5L/cKtgpfi5S4Tw0fQmaQ1TGFEEFSFSMe138bjADravgJOKmOEhQhEXv12wK9
         eOtw==
X-Forwarded-Encrypted: i=1; AL+hErF49Pym0aY6YGNlrwp5h1R7cY19YLs47WLK6VtOy1yvv8QfSOvMNXNGj8npOBCH/SAMm3uN0Rs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wmjxLGmqDGPuHBo6IQ1Mfp9BQgvPNp1cPJtNW/uJR/lxAC5pM
	eiPG77in71WyH+wlXxHBitUWrmF32r48v5e9jqTu9UXeN3CtQMKNF9Qbd7bO9M6ZyE7UOzgmzrr
	u7HTUzVqt3cCq7E/IlUhENm3qPQye3pskuPdK4sK/ZtW37I76exrfFCU=
X-Gm-Gg: AZFdTZfj6wrhy6poH8daHIkKL18XWRwAghDxUOD5z/dprG6lFYYpsp3/GGSZwOYUL/3
	YEfOxtrGsm8pmZF769rg2mfoo/Pl+OVhFrIy6qJ3/g5Cx7SAeXvHfMadN3+x18PDgDKO43/70PN
	n7fZpBiWe47HoF3u+nJ6gOqAE07xT2a/8xWtpsFDIQNGpnPsqch1fxfUMACL2KcHfIbgUginvNk
	uV0hsdpo6LOmbxDRY1qB7JQ68/0V9FUTIk5qrVOF9Wn/atbDKb2nRHqjZnKT8Q2X9mnyh5dko1r
	ygtAWXYJlRiFbggKX4eIC4UGtrgRC/1XKGHvjQxATD5osNUpDmoyH/p3aX8MfyDct6KPpaZHPhC
	ORQiyAX74uKadwcy92RfG9Rhyj5x8IiWUbMThhtXPsfbDtvLDcFq7ufJ0vXI7m6MxadwuaCtKqo
	huVF9Eo+A8lWyzVdqbrPmDlWKmA4iMeaFpc+XeaUzj6Zd1XdxFrxFRrRetQHwPkOUvOqKnrZQ+5
	os9/yWUILgB+0xjA1zWsRYLo/ILMveAAsevRzsh80yMaabcB41OXkpvnA==
X-Received: by 2002:a05:690e:44d4:b0:67d:b34c:9f1b with SMTP id
 956f58d0204a3-67df448dcffmr4673703d50.91.1795607224629; Wed, 25 Nov 2026
 03:47:04 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 25 Nov 2026 03:47:04 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Dickson Wu <dickson.wu@certik.com>
Date: Wed, 25 Nov 2026 03:47:04 -0800
X-Gm-Features: Aa3M54ocuDpdXBqObWURUsGlsNR79rrz8CEPFIgf2xFRqmvisrPM8Zs7y9wPI7A
Message-ID: <CAFaZ9erzjfA3ogfym5X53zX6fW1kMTHcOnu7rMdkCeq=H64Qbg@mail.gmail.com>
Subject: [PATCH 5.10.y] net: mvpp2: limit XDP frame size to the RX buffer
To: stable@vger.kernel.org
Cc: Til Kaiser <mail@tk154.de>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Til Kaiser <mail@tk154.de>

commit f3c6aa078927e6fe8121c9c591ddee8716c5305a upstream.

mvpp2 has short and long BM pools, and short pool buffers can be smaller
than PAGE_SIZE. The XDP path nevertheless initializes every xdp_buff with
PAGE_SIZE as frame size.

XDP helpers use frame_sz to validate tail growth and to derive the hard
end of the data area. Advertising PAGE_SIZE for short buffers can let
bpf_xdp_adjust_tail() grow a packet past the real allocation, corrupting
memory or later tripping skb tailroom checks.

Initialize the XDP buffer with bm_pool->frag_size so XDP tailroom matches
the actual buffer backing the packet.

Fixes: 07dd0a7aae7f ("mvpp2: add basic XDP support")
Signed-off-by: Til Kaiser <mail@tk154.de>
Link: https://patch.msgid.link/20260607134943.21996-3-mail@tk154.de
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
[ adapted to 5.10: no xdp_init_buff() here, set xdp.frame_sz directly ]
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
5.10.y is the one stable branch still missing this. 5.15.y and newer
already took it. 5.10 has no xdp_init_buff() and mvpp2_rx() fills in
the xdp_buff by hand, so the change lands on the xdp.frame_sz
assignment instead. Same value, same spot.

Tested on v5.10.275:
- x86_64 allmodconfig (CONFIG_MVPP2=m) W=1 build of mvpp2_main.o,
  base vs patched, no new warnings
- x86_64 defconfig with CONFIG_MVPP2=y builds and boots under QEMU/KVM
- I don't have mvpp2 hardware, so the XDP short pool path itself is
  untested here. No existing selftest reaches it.

The other two fixes from the same upstream series, 5e8e2a9624df ("net:
mvpp2: refill RX buffers before XDP or skb use") and 77a6b90ce56b
("net: mvpp2: build skb from XDP-adjusted data on XDP_PASS"), aren't in
5.10.y either. This one doesn't depend on them, so it's on its own here.

The backport and the test runs were prepared with AI coding tools
(OpenAI Codex agents, with review by Claude). I went over the result
before signing off.

 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index cb0e319bc2f1..3e60d40b3f6f 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -3617,7 +3617,7 @@ static int mvpp2_rx(struct mvpp2_port *port,
struct napi_struct *napi,
 			xdp.data_hard_start = data;
 			xdp.data = data + MVPP2_MH_SIZE + MVPP2_SKB_HEADROOM;
 			xdp.data_end = xdp.data + rx_bytes;
-			xdp.frame_sz = PAGE_SIZE;
+			xdp.frame_sz = bm_pool->frag_size;

 			if (bm_pool->pkt_size == MVPP2_BM_SHORT_PKT_SIZE)
 				xdp.rxq = &rxq->xdp_rxq_short;
-- 
2.43.0
