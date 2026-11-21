Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795243264;
	b=wWkcSao1EBJQBITQZSw/b1cPdxiJDUsR92Bz90Pdy809p7eicfEMWfqPaMbhIvwv763v
	 6bUGtFOTFvQ77epPwaIN5/QNQg9bc/ZXJbqbjv9ek1YfOiK8errymB5u8iDiWpeNs9aUt
	 uudsxf4F6ikHs6XiTwXG1S+xc+JSA5rHLhCtRVP0sqFJtd6LCDspehVNFtI9yRxS/vxSH
	 pFzBc/evYLqJQTAZPc9cEvYEwKxJrtIWDepvLQ9piNPlM+SJpxlUjG+AMHeeAPMjvHxdh
	 NCaLjUuxyyakXJ8MGieS5/49GtqMO7GP6KaoWbrc6WZHuNvCN1MYRNv0tEsQbQNGP5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795243264;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dXJEERl4R39rYO0mj2Fwx29+mu/W9zu/9puNt9En2r4=;
	b=QuiUgW9vVhMkioWa1DWM3yaBwLit3EV1MvTyhMm7VFzPRrigs6hAfmHDRXwVVfx8Bdvd
	 d/3NUjxCbe68vBeNv7h/h7KgdB2MxidGZV2hM0etCWba+wMnC5Q882oF4stwyFwnW9HO9
	 0hfkB8F592CRM25L7TLyi3NLs54vHa8tflDR7yaW6oMmg2lWgu5ewT9yFK0mqSnC6nkN8
	 2nFsORYVzcWYvvwOp92K7WSJA2o1Nn98ikvfGnwb5mVVEP0AZinN3rwuHItvPPy0VnEan
	 nN/K+3wp4ovgiqrBbvSJCS4jWn9DXuQ4EEG+hFgPrI8xmelzhDnf0PdSjnsmaaaOUZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="l8X/IK1V";
	arc=none smtp.remote-ip=203.205.221.231
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECC4606A333
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 06:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ECC4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=l8X/IK1V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795243253; bh=dXJEERl4R39rYO0mj2Fwx29+mu/W9zu/9puNt9En2r4=;
	h=From:To:Cc:Subject:Date;
	b=l8X/IK1VArSmHi1JtoHX3Gf+jvNmqPImxszrSbNGhgoceNqd3vgqHHhAAo7V52YHG
	 Z2ihrJ5weLtVzK9eHGG2cTixxd+zqQnrNR6xdVDD3rCPzILk5sEeQFhBAvii6xGq57
	 5blJlUZTl2eGerFwDAdgMV4R9KnWk5BnoppbSK5Q=
Received: from time-VMware-Virtual-Platform.localdomain ([121.231.158.120])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id A3339A68; Sat, 21 Nov 2026 14:40:51 +0800
X-QQ-mid: xmsmtpt1795243251t207s8qin
Message-ID: <tencent_BE8DC9842FFF55349D2FCCDE456B9C6EB709@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+qHDQ6vPbX1ll6KHCj+7zbFtWj3nvqfMuiD+iqdNNcbq1QrKDAn
	 zHmtxlWlGy76aG0yPWqw9CCNmiXQHv+3iUTDr7ebloxorBXedL0rPQbOvI9n+HrQwm0WjrSrwmaj
	 BiUnAWyAu3uyLj+/aXOx+sjXDdCk8J+nZ5FWvO7l1ijNZK8HlSq8kIuRfuiuLIuG7qXvt7Nbljry
	 WUUY1ceXaw3RZT3l4njEUT1PJad2HKXVI+6QFqEXkCLQCX39uzSLhkxbDC5dTnHT9gcQjWJRaEnj
	 ko1TFdvFp6WlEeWXr1CBJhKve+4BsqgIXflxN31ES9/YOUqRpq3pQOo3RDi2yNwJJmRzQUPkWIHR
	 RXaqf15aZKbvCWCSoI733NkdSV7GvfsFn7Df+ouoxcBdo8xa9P5Piq6ruMPAIswvgHUvIrPOCLnQ
	 kL0vodkXtWyu5Xh/HTci6/Rxjdp4wU32AjUqA4EUs5H0cdyjatrHohnNrrn75mag8sYB5CE3lZkR
	 Q+bEAm68G4bgqHDSCOIJyy/V/UKcxn/ycGfcs7oI8Ljo9qgLyMP3h7ptAroFcP7C8DKDm5fc8p/y
	 /Yr7wLcMPgTfxuDzvLuOjTqZHR0k0WiDtjT4LDRQP/MnikO/ORXdPdgEyDI25ZskFZ6zHkgdzHrw
	 HqBSkFqojMpt/SOdSRR4aHdAj1SuFfur7nGG9YWOOrPmMSofQZZaxVn1l9zPqNOvMflIuO8PEL6E
	 lx9e7r2fypJWAP46yROCEDMwdI/CBRJS6U5qxGm7JHav9gC9VTJPuRz9xxBTyscWS6QLdp6/TQSs
	 5+goezpMxVSr5QZcMrx2xqAKeuQK61YlaXqZ8B2Xt2sXOtkE+EQEt3ggbTvfo4hwjvM/AzBi7lN8
	 Axo3we+Mz5Ds+AUlE4UI2zuwujEstg5CrNh8ncZ+OId78U73LvRB89mCr6ugZHr+VobzYlIecFPb
	 mIYnOIelxD06DebCCjP6nGuT9NXFqmbbPtVlmLm8F9J/gO9jtTngUaeZxRTGbZLXSReauk8VJ2eG
	 nNej0M9hypsS2Nfms+vUAVzU5qmHbYbttKwSFa5UrnumyAi7/Jy1Qit1yTEEKS2WHBb1zWzSOQmp
	 dy6X4M
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Dai Wenjie <3596417740@qq.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Dai Wenjie <3596417740@qq.com>
Subject: [PATCH] ipv6: reject datagrams that leave no room past the fragment header
Date: Sat, 21 Nov 2026 14:40:48 +0800
X-OQ-MSGID: <20261121064048.5306-1-3596417740@qq.com>
X-Mailer: git-send-email 2.43.0
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

__ip6_append_data() does not check that fragmenting can make progress.
When the MTU leaves only 8..15 bytes past fragheaderlen, maxfraglen
collapses to fragheaderlen and the clamp below reduces datalen to zero:

    if (datalen > (cork->length <= mtu ? mtu : maxfraglen) - fragheaderlen)
            datalen = maxfraglen - fragheaderlen - rt->dst.trailer_len;

The paged allocation path (MSG_SPLICE_PAGES, MSG_ZEROCOPY) then computes

    pagedlen = datalen - transhdrlen - fraggap     (underflows)
    copy     = datalen - transhdrlen - fraggap - pagedlen

where the two underflows cancel and copy evaluates to zero, while
skb_put(skb, fraglen - pagedlen) wraps back to a valid size.  length -=
copy + transhdrlen therefore consumes nothing, and the loop re-enters
alloc_new_skb, allocating one skb per iteration until the socket wmem
budget (2 * sk_sndbuf) is exhausted; it then fails with -ENOBUFS and
ip6_flush_pending_frames() drops the queued skbs.

A 64-byte UDPv6 datagram with IPV6_MTU=1280 and a 1232-byte routing
header (fragheaderlen 1272) reproduces this on 6.12.96: with SO_SNDBUF
set to 128M, splice() spends 152 ms on-CPU and allocates 514 MB of
transient kernel memory before returning ENOBUFS.

The non-paged path is not affected: pagedlen is zero there and the
existing copy < 0 check returns -EINVAL.

Reject the datagram with -EMSGSIZE when the room left after the
fragment headers cannot hold rt->dst.trailer_len followed by
transhdrlen and fraggap.  The arithmetic stays unsigned throughout:
maxfraglen, fragheaderlen and fraggap are unsigned, and the subtractions
are guarded so that neither maxfraglen - fragheaderlen nor
room - trailer can wrap.

The check has to sit inside the clamp instead of next to the earlier
maxfraglen validation: a zero-payload datagram of exactly mtu bytes
fits in a single packet, is never clamped, and must keep working.

Signed-off-by: Dai Wenjie <3596417740@qq.com>
---
 net/ipv6/ip6_output.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 50b41be5d..de033a35e 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1610,8 +1610,18 @@ static int __ip6_append_data(struct sock *sk,
 			 */
 			datalen = length + fraggap;
 
-			if (datalen > (cork->length <= mtu ? mtu : maxfraglen) - fragheaderlen)
-				datalen = maxfraglen - fragheaderlen - rt->dst.trailer_len;
+			if (datalen > (cork->length <= mtu ? mtu : maxfraglen) - fragheaderlen) {
+				unsigned int need = (unsigned int)transhdrlen + fraggap;
+				unsigned int room = maxfraglen - fragheaderlen;
+				unsigned int trailer = (unsigned int)rt->dst.trailer_len;
+
+				if (maxfraglen <= fragheaderlen || room <= trailer ||
+				    room - trailer < need) {
+					err = -EMSGSIZE;
+					goto error;
+				}
+				datalen = room - trailer;
+			}
 			fraglen = datalen + fragheaderlen;
 			pagedlen = 0;
 
-- 
2.43.0

