Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542184;
	b=UcKVB7Gfppm0hFZ7HVAkbQqIweavpSQ4eavvOnwWRQE869ffBsPty/jqpKMCGX2onT1b
	 Dr5LSF/Z0R7JvNses8M3sw/XAT0um2R3c/Fae+UVQG0R3ccQ5719jC24Kbx5nGadMEUej
	 hRhBBvfxquwPVTXHKAuuih/bo7Oy51ZuftAcADMom9jU6nRlSK9xG7XjvZS6mbT8QxPOa
	 jXanph5dQrHFqtyFH0gwJdXK7/jPkOEY8y+TC2jp8N8k5XxBQJgBAZKpTRmEn8t1Et5VF
	 Xa2XLJRkP8kybYddxyB7XllDx3O1CCD3VSau8cD+92pailuunICUt8r9kkjfV6jVucQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542184;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=h1h4yHjmlBs3vGOFXi6iqSSsWYYmwiIUlQRsrgTKDBk=;
	b=B6N3VBC+Il0lJZ6MPQYLifaUcsSukwPHlkXjTFh+zPscIQozIp3mkmpd4QGzYbB2HQY6
	 N8x4L27nrxKyL3j4R+9uYYthz4dfAQJGNS+wXX96HhKZF4eoZwCa5QM7sK4RMHXqy1gmq
	 HmNH7cZcsKVBUXk4kfloCw/1wclQ5IZS+tiCkBh9hUMPnHTs5u9btV7AunpYkGOPeaLVk
	 Hhskn3IJrtRF6kz9gWSEeMU4zxjQRDOORFb+GHALTvRl3RAopejqKeVFvIQBjWVGY5WvG
	 3nDi9kRujuD3kwJJZGc6Vy1w1uWZDZm9sxahCExoAvrbngDI+ETfTd8Nein6qrhN6ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ps3KWkG3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3D7606A32A
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ps3KWkG3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E871F000C0;
	Tue, 24 Nov 2026 17:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542184;
	bh=h1h4yHjmlBs3vGOFXi6iqSSsWYYmwiIUlQRsrgTKDBk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ps3KWkG3XHtXCF7cxxhNPGQjQJ76eJddx6cnN6bxZdZOUrEuQKX0v9mQaLzFMMoi6
	 pctTi0DAIDM8Nim0YRkbRIwUBDqnrUcEzvgfQGL7X2cxRVyo+I+fQaZRGYhssyJj+9
	 RsKIFTNIQqIFI2Cdn+tAwr+3H/erDmQMqn/BS8f74DFFqlylcp/jFzKSRLbs28exwR
	 K5Q/jt4zVSbvNnqSaKbdMhW6sUcNDtVtvVyKvxQW0gN10LfX+NmwsfPtSVhNFgpdbc
	 WEll5w/qQ3tUU4RQy80uHvr/dzJ05T5ukwhX+rulF2W7TpQrjky2dz+8Q6CmUJZh4e
	 hmnwxBptWpkKw==
Subject: Re: [PATCH net-next 3/4] selftests: drv-net: add a kperf stream test
From: netdev-bot+sashiko@kernel.org
To: sdf.kernel@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Date: Tue, 24 Nov 2026 17:43:03 +0000
Message-ID: <179554218364.3135.5016659919665552355@kernel.org>
In-Reply-To: <20261123174120.505808-4-sdf@fomichev.me>
References: <20261123174120.505808-4-sdf@fomichev.me>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In tools/testing/selftests/drivers/net/perf/stream.py, the
  "zerocopy" variant of tcp() passes ["--msg-zerocopy", "--zerocopy-rx"]…
- [Low] The commit author address (Stanislav Fomichev
  <sdf.kernel@gmail.com>) does not match the only Signed-off-by…

--

selftests: drv-net: add a kperf stream test

This adds stream.py, which uses kperf to measure the throughput of one TCP
connection. It runs a copy variant and a zerocopy variant (MSG_ZEROCOPY on
the sender, TCP_ZEROCOPY_RECEIVE on the receiver), and reports the result
through ksft_metric().

> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

[Severity: Low]
This isn't a bug, but the Author: address (sdf.kernel@gmail.com) does not
match the Signed-off-by: address (sdf@fomichev.me). checkpatch reports this
as FROM_SIGN_OFF_MISMATCH. The other patches in the series have the same
mismatch.

> diff --git a/tools/testing/selftests/drivers/net/perf/stream.py b/tools/testing/selftests/drivers/net/perf/stream.py
> new file mode 100755
> index 0000000000000..4ed9d64dfa320
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/net/perf/stream.py
> @@ -0,0 +1,40 @@

[ ... ]

> +@ksft_variants([
> +    KsftNamedVariant("copy", []),
> +    KsftNamedVariant("zerocopy", ["--msg-zerocopy", "--zerocopy-rx"]),

[Severity: Medium]
Does the zerocopy variant exercise TCP_ZEROCOPY_RECEIVE page mapping on a
default NIC configuration?

tcp_zerocopy_receive() only maps frags that pass can_map_frag() in
net/ipv4/tcp.c:

	if (skb_frag_size(frag) != PAGE_SIZE || skb_frag_off(frag))
		return false;

Without header-data split and HW GRO, payloads usually sit in sub-page
frags at non-zero offsets. In that case nothing gets mapped and the data is
copied, or kperf fails, depending on how it handles this.

The commit message says the test runs "with the same settings as devmem.py
otherwise". However, devmem.py's kperf() turns on rx-gro-hw through
_enable_hw_gro() and configures the rings with:

        "tcp-data-split": "enabled",

It also sets hds-thresh to 0 where the driver supports it. stream.py does
none of this.

The only output of tcp() is ksft_metric(), and metrics do not affect the
result. So nothing shows whether zerocopy receive actually took place, and
the zerocopy number depends on the driver's default HDS setting.

Could the same HDS and HW GRO setup from devmem.py be applied for this
variant, with a skip when it can't be enabled?

> +])
> +def tcp(cfg, mode_args) -> None:

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123174120.505808-1-sdf%40fomichev.me
