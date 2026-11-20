Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147515;
	b=BhiQsapDxW+EchhgSjAAetnpJEDDIuzpZBa/06hPlJK04RK7fCP+U2uJ7HvqhUNqXzTz
	 LOjD+rtXLYR7VlCdEfFPa9UlYylhWko47LEo5d80W8MJKrwjBe2OnX5sCE4ZoLQTqFEf6
	 NupF0xEhY4sVyTycWhhP/8XsbYFjIg21gy2OeuYmoWTGkptP6a8bfVcJE1XxlR9OaVim6
	 j1LrnnNewIOUo/9LzuDuWCL5w5YwZ3rHXBM0N5WQY4FPS6GQN+EusJJGo/7mETgvHm9Y2
	 Fg14BBi7+PjLrvcKuGwLUUXtDqaXaLuB5exwFqvBHtdYEnHPGIFoe8Wx6fyhZx6DN7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147515;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dXZ+MkOfcbD9xgZMo78VM9d3Xg0HFryzSuLW2pgi6sg=;
	b=CXeg9Yt2q8nCwvCraI9wnnkLKkTfMm0RvUrJEPrwT/1HnPd23aqCAgYzSEEaitGJSrqs
	 KqHglgBAJn3q/BFEsWMltHAzcbRp0X2y9UrdqpnyFC56kGOE65cN1rE73wbqq8TfqoR5T
	 uMf2AdDcBFksw7YHAc1NM2Hk45xzfQALlK5Qs83eG32QhZT+zJIPzjrfXhkxcqz5eirqC
	 kNZvUxQ+tOGTf/HIcSSKZkwCtHcbcVZRlYyI2WYQ6mRwg7Z7sXt3PsJyZMd3UQL85ak7O
	 2/RIBiZ8GW2NL82iesYViowCWEkFV5se7Fp+MdkVTul5v7iA2YIHs9VY53qVIFvRwow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dRK1+2Id;
	arc=none smtp.remote-ip=95.215.58.98
Received: from mta1.migadu.com (out-98.mta1.migadu.com [95.215.58.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18D2606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 04:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A18D2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dRK1+2Id
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R7dRqapwywAAqTCXIxiiZZ/ZqPLt+Ab1/NlMn2/RS/Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795147512; v=1; x=1795752312;
 b=dRK1+2IddyCulMueGpkaxdSy6TeN4oOBbGRxUAf7Nu3IMOtR1g5KGwnjlnHCXR8Ys1SLbGKR
 AdasdnBzwDPDuvPUzMJ/x/2DbDiBJIqZuvObNF/BXiKboDHjz0OJtrNRMgcidA9yH8t7ZXadYOF
 NKnMaWD250LJBh2/aNTNsdDg=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b2d00adc90459cdf;
	Fri, 20 Nov 2026 04:05:12 +0000
X-Mizu-Trace-ID: b2d00adc90459cdf
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Kyuwon Cho <kyuwoncho18@gmail.com>,
	Eric Dumazet <edumazet@kernel.org>,
	stable@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH net v4 2/2] tcp: fix shift-out-of-bounds in inet_csk_rto_backoff()
Date: Fri, 20 Nov 2026 12:04:36 +0800
Message-ID: <20261120040447.195446-2-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120040447.195446-1-jiayuan.chen@linux.dev>
References: <20261120040447.195446-1-jiayuan.chen@linux.dev>
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

icsk_backoff is used as a shift amount in inet_csk_rto_backoff():

	u64 when = (u64)icsk->icsk_rto << icsk->icsk_backoff;

It can go past 63 on the paths of both callers:

 - RTO: tcp_retransmit_timer() increments it on every backed-off RTO
   with no cap of its own, then an ICMP unreachable goes through
   tcp_ld_RTO_revert().
 - zero window probe: tcp_send_probe0() increments it up to
   tcp_retries2, and tcp_probe_timer() calls the helper in its orphan
   check. commit 6d4634d1b091 ("net: Limit logical shift left of TCP
   probe0 timeout") clamped tcp_probe0_when() but not this one.

Seen on the RTO path with tcp_retries2=255 and a silent peer:

  UBSAN: shift-out-of-bounds in ./include/net/inet_connection_sock.h:258:40
  shift exponent 73 is too large for 64-bit type 'long long unsigned int'
  Call Trace:
   <IRQ>
   dump_stack_lvl+0xc1/0xf0
   dump_stack+0x10/0x20
   __ubsan_handle_shift_out_of_bounds+0x1d1/0x390
   tcp_ld_RTO_revert.cold+0x16/0x92
   tcp_v4_err+0xdb3/0x13e0
   icmp_socket_deliver+0x1a7/0x390
   icmp_unreach+0x2dd/0xe50
   icmp_rcv+0x93e/0xe30
   ip_protocol_deliver_rcu+0x36b/0x3e0
   ip_local_deliver_finish+0x37d/0x620
   ip_local_deliver+0x165/0x1d0
   ip_rcv+0x284/0x320
   __netif_receive_skb_one_core+0x16b/0x1c0
   __netif_receive_skb+0x21/0x150
   process_backlog+0x37e/0x1200
   __napi_poll.constprop.0+0xa5/0x5e0
   net_rx_action+0x4c0/0xf70
   handle_softirqs+0x204/0x9b0
   __irq_exit_rcu+0x13c/0x220
   irq_exit_rcu+0xe/0x20
   sysvec_apic_timer_interrupt+0x92/0xd0
   </IRQ>

tcp_retries2 does not need to be changed for the RTO path: with
TCP_USER_TIMEOUT and TCP_RTO_MAX_MS set on the socket,
retransmits_timed_out() only looks at the elapsed time.

The zero window probe path gives the same splat from tcp_probe_timer().

On x86-64 the shift count is masked, and the u64 can already be 0
before that (e.g. icsk_rto == 200 and icsk_backoff == 61). An orphan
that should be dead can then be seen as alive in tcp_probe_timer(), and
tcp_ld_RTO_revert() can end up with a smaller RTO than intended.

Cap the shift at 32: any non-zero icsk_rto << 32 exceeds TCP_RTO_MAX, so
the min_t() result is what the unbounded math would give. The
ilog2(TCP_RTO_MAX / TCP_RTO_MIN) + 1 bound of tcp_probe0_when() does not
fit here, as icsk_rto has no TCP_RTO_MIN floor the way tcp_probe0_base()
has.

Found by checking sysctl ranges against their users. Reproduced the RTO
path in a VM with UBSAN: a - r - b netns, tcp_retries2=255 and
tcp_rto_max_ms=1000 on a, blackhole route on r for 75s, then switch it
to unreachable. With this patch the splat is gone on both paths.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Kyuwon Cho <kyuwoncho18@gmail.com>
Closes: https://lore.kernel.org/netdev/179499954853.1440581.6627074959099619480@gmail.com/
Suggested-by: Eric Dumazet <edumazet@kernel.org>
Link: https://lore.kernel.org/netdev/CANn89i+=QRibXsm6tw-eVwhB3wjOtgF-MtVu0G--K5=oWP97+A@mail.gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
Tested-by: Kyuwon Cho <kyuwoncho18@gmail.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
v3 -> v4: rebase, update the commit message. No code change.
v2 -> v3: mention the zero window probe path, add Reported-by/Closes
(Eric) and Suggested-by/Link (Neal), say how it was found and tested,
point Fixes at 1da177e4c3f4. No code change.
---
 include/net/inet_connection_sock.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/net/inet_connection_sock.h b/include/net/inet_connection_sock.h
index 903499581db7..562e12033a5d 100644
--- a/include/net/inet_connection_sock.h
+++ b/include/net/inet_connection_sock.h
@@ -255,9 +255,10 @@ static inline unsigned long
 inet_csk_rto_backoff(const struct inet_connection_sock *icsk,
 		     unsigned long max_when)
 {
-        u64 when = (u64)icsk->icsk_rto << icsk->icsk_backoff;
+	u8 backoff = min_t(u8, 32U, icsk->icsk_backoff);
+	u64 when = (u64)icsk->icsk_rto << backoff;
 
-        return (unsigned long)min_t(u64, when, max_when);
+	return (unsigned long)min_t(u64, when, max_when);
 }
 
 struct sock *inet_csk_accept(struct sock *sk, struct proto_accept_arg *arg);
-- 
2.43.0

