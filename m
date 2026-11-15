Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794715854;
	b=lxCSzyjkgbhJmHJ6CfVVu4StElQChH49v00hfBxZHnlM89vZLxqJAQb4jk6M9EZ6FTpk
	 4r8nhJP2O/nyltxfRmXkWK5yrUBkiWJdzS0+QVyUKwa54OBeAqLY85omHS+0fVbck6HWV
	 jYJU991jRSXFcd2u37wu2tZ/W0AE+0K4zNJbp9PjMHjzP87ImKyH/CsQBsSJ76m1Idu+2
	 /LgWae8YS3fpIKd+9xhWou1S+5qlhQinw5oOGJgbgedrirE7rZ/NXp4XEb6msvji0l8ms
	 beK8ToFmc5OWE1MifG0yzXo6fVF7lCzlTFYSh6ziiAGl8eNkgPFPonbOXb0oSWFOxHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794715854;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=T2PCQ24rcTY2zFQSzsrl4wzyPOBFrVHAmJUkjy6sF60=;
	b=jes9jUrmDuqJz/FeEVqmoQAycn2bflY51krrlkoX6ZwuA3B0RzdWtJj0cTiLe7CiDwmg
	 v93cx1Dgby/Tb6Iw7HvQABztn+wfjhbUEX39NIYKKnyMBslfkkYhhITlcZEFdHrMzqw8Z
	 QZ/nPUUCFgpaCBsqGsuiwMUOFsOLRHFRIYKx24pCxm5KzQl9CDwM0tE67u9WqF2b79n48
	 bzPXaPTiEoZkuJtu/VXE5aMsIE55X8aR0+A3Yqj3Q356tuLork6553Oz2VmQPSd4qTdNs
	 frde3ga8R/aB9DRVcz2bVsj2XrqC9x7TyQg6PiLuOXpYpgr+RAOCO29enzJBBSaOTmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SljNCKbo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D740D606A885
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 04:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SljNCKbo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1192E1F000C7;
	Sun, 15 Nov 2026 04:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794715854;
	bh=T2PCQ24rcTY2zFQSzsrl4wzyPOBFrVHAmJUkjy6sF60=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SljNCKboEt6NEeUQnE/wHtVdh+R1gE+DQ7ESSSlnejD/fVvuUdnTi3sGRhDJdfG8j
	 SE5P53o2DBpqJp5zxdgGeTu324+ZENsQovq2Iw1fGRPAWxX8+qzn4x4jbaARrg2Bgk
	 EmIINkmHAYLhypm1LpU840v1Kuv2hVW2BQsvhNIumud8t7SEnHp95pzmiE6AFor1T9
	 P+/8HFZX+KXEiFgesf/miN1kaEaQhvPQGHn951kMg19XacyrdEUuDs+b0pEMZXqAPb
	 MDoo5nWMxdxyXySLBRR7AE0ogljgJ5+mbKRlySWDWNA2h5jbpoSLCB9w5WFv1Y/ZkN
	 94nZoh/mqSkjw==
Subject: Re: [PATCH v1 net-next 8/8] selftest: packetdrill: Add test for
 tcp_collapse().
From: netdev-bot+sashiko@kernel.org
To: kuniyu@google.com
Cc: edumazet@kernel.org, ncardwell@google.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, kuni1840@gmail.com,
 netdev@vger.kernel.org
Date: Sun, 15 Nov 2026 04:10:53 +0000
Message-ID: <179471585361.2199510.8278791801489281054@kernel.org>
In-Reply-To: <20261114040101.1043546-9-kuniyu@google.com>
References: <20261114040101.1043546-9-kuniyu@google.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message does not accurately describe the test in
  tools/testing/selftests/net/packetdrill/tcp_collapse.pkt.

--

selftest: packetdrill: Add test for tcp_collapse().

This adds a packetdrill test, tcp_collapse.pkt. It checks that
tcp_collapse() only collapses runs of low-density skbs, and leaves
high-density skbs and an isolated low-density skb alone. It also makes
ksft_runner.sh skip any script whose PAGE_SIZE define does not match
getconf PAGESIZE.

> tcp_collapse() now does not collapse high-density skbs and a
> low-density skb sandwitched by hihg-density skbs.
>
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

[Severity: Low]
Is a step missing from this list? Between steps 6 and 7,
tcp_collapse.pkt queues one more 62,000 B high-density segment:

// 5. Queue a trailing high-density 62,000 B segment.
   +0 < P. 217001:279001(62000) ack 1 win 65535
    * > .  1:1(0) ack 279001

The file header says the test checks that tcp_collapse() "skips leading
and trailing high-density skbs". The SO_RCVBUF shrink comment gives
sk_rmem_alloc as 334,592, and that figure seems to count four
high-density skbs, not three.

The last paragraph says sk_forward_alloc goes negative if
sk_forced_mem_schedule() is removed without the series. Does this test
catch that case?

The test only passes or fails on three checks:

- TcpExtTCPRcvCollapsed equals 30
- TcpExtTCPRcvQDrop does not appear
- the final read() returns 279900:

   +0 read(4, ..., 300000) = 279900

None of these checks sk_forward_alloc. Could the message say that the
test does not cover this case?

The message also has a few typos: sandwitched (sandwiched), hihg-density
(high-density), and sk_forwad_alloc (sk_forward_alloc).

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114040101.1043546-1-kuniyu%40google.com
