Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542186;
	b=UCAWf3erFex0GWInzWgJ12jeSfwfgf6YljgBTGkG4fg46wxvNAk3K1Bw4U2qbmaxzhxP
	 ikbaq2IrYmaOEC3UWdF24vy4dLqGrqkJTC0wEchtb51B+H7NtvwlLh5wIkiw95UdKCjPl
	 dAE566IwHrHEt+DoodadjgEcZR6OFrySyoT0jwoG/5TyZsEEJcG3n+24B4ZsuiU5W4qQT
	 keYLQna0rIasQplxvVHl46rCj92Xk1iHG0h/w+Gxkq82oLBhwJgy69OmXHJN8mlSA2ypp
	 XNdJvnMlg1406XlcK1WSi1Z4zsBlQygQISn5EEgQ57WGd45TUzuqlrEP6/1Z+pHjVLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542186;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=R3vZhtZB0lPAijKxMqdgnTzdmzTahv2cqayjlfLzb9g=;
	b=ByNKXw6vgfLdFa8th3j9NKM3n4gNAiLlV1VJOpN6APKx5qFxaEIGmb/agh4CQHe315u0
	 W6oTy0S94EMwtNNJaqnu0udhwhjBuPBunmKGH99YCCvvF7lDB4uqPOTKxgAeLIcfwXpea
	 KhiV7dI119djqchLVPwaOpeggXOkTiFW26VFKnnCtbgfzuuSfEwLCzdllx7Sxd/ko8o4E
	 Dod5LfCnhjKChDTVXMfeI/jCiOJu2IemkJqC/ucxK6z3aKFWjvq5Ffv77r/AFqCm948m7
	 1a8m9uIt8wU4cckDk/JxyGoBBi+v+oJlQLqJSq8mnoxs5UwZTU1Ur4H1baMP9m4yZTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IZr0nQac;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A486606A32A
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IZr0nQac
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02F91F000F4;
	Tue, 24 Nov 2026 17:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542185;
	bh=R3vZhtZB0lPAijKxMqdgnTzdmzTahv2cqayjlfLzb9g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IZr0nQaclXhg/fz6MBhvcdyvOhz94CCkxvM3QtHBbR3qlVSpV4Z3CGmjo5+v513jq
	 OsqlFu2nHlrivHkFfsHwoWzzfzAWyptp71gbhxso3OhwubU1nUdlIEgA7M0VVuvQK2
	 xL97W/6fRlBroITGdMV5VJ7/r/i2h5JMJQsNGIANeawvKfzF09syFbH4Av+tbUF0pJ
	 32Ui1zOwLZJYoVf5hXo0Lmnpb5P8Tw21vCe7CFcjxFqvyDAxFvXmEqmPdkiofMBjNZ
	 Ldo15GE3rI1eH5a890UynyIZPUe5hqCeaX4vf3g3Fg7PzpG2s5EDmndg6mxpSkmCvD
	 0prEbsipvkXxg==
Subject: Re: [PATCH net-next 4/4] selftests: drv-net: remove the iperf
 performance test
From: netdev-bot+sashiko@kernel.org
To: sdf.kernel@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Date: Tue, 24 Nov 2026 17:43:05 +0000
Message-ID: <179554218522.3135.16126993421700976202@kernel.org>
In-Reply-To: <20261123174120.505808-5-sdf@fomichev.me>
References: <20261123174120.505808-5-sdf@fomichev.me>
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

- [Low] The author and the sign-off use different email addresses.

--

selftests: drv-net: remove the iperf performance test

This commit removes the iperf.py throughput test from the drv-net perf
selftests and drops it from TEST_PROGS in the Makefile. The commit
message says single-stream iperf3 results vary by about 10% between
back-to-back runs, and that stream.py with kperf covers the same case.

> Author: Stanislav Fomichev <sdf.kernel@gmail.com>
[ ... ]
>     Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

[Severity: Low]
This isn't a bug, but the author address and the Signed-off-by address
don't match. The author is sdf.kernel@gmail.com, and the only sign-off
uses sdf@fomichev.me. There is no in-body From: line either.

The names are the same and the addresses differ, so the
FROM_SIGN_OFF_MISMATCH check in scripts/checkpatch.pl sets
$authorsignoff = 4:

scripts/checkpatch.pl:
	} elsif ($email_name eq $author_name) {
		$author_sob = $ctx;
		$authorsignoff = 4;

That leads to this warning:

	"From:/Signed-off-by: email address mismatch"

Nothing in the tree links the two addresses. .mailmap maps only
sdf@google.com and stfomichev@gmail.com to sdf@fomichev.me:

Stanislav Fomichev <sdf@fomichev.me> <sdf@google.com>
Stanislav Fomichev <sdf@fomichev.me> <stfomichev@gmail.com>

The earlier commit c1d2b8e89a29 ("selftests: drv-net: add an iperf
performance test") has the same mismatch and was merged anyway.

Could the author be changed to sdf@fomichev.me, or a matching
Signed-off-by be added for sdf.kernel@gmail.com? A .mailmap entry would
also link the two addresses.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123174120.505808-1-sdf%40fomichev.me
