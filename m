Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832357;
	b=Wagwbg1+SJdV7F9KkosbrWoTIyROrPMHX2BaVccCkcRWvTtoFvJC1scKIpC4H0whPQJz
	 P+5tqUCTq7AjXkIEXuTkSPUI9j85iK9sp8Y/KV6Q7niZaWQHAMkCnfVN32sSmVUQfjtOS
	 9JsLhFAuNgBRLDVooY//II2Xuwrzb1ye1FP7QR80VqIff5JgQm0hGHXOoy5SMynBD30Bk
	 xxHzq50mOo5YcYTRCecxWAi6LFq2Emyko+5GTM3n7HdkghvCfpEBncN1c6Kqvjo6bDzml
	 kNaOkaOECAES2N3MZYHEwv2CY+IVf5rcu2XLTvy3QmbIdu+L2QaxWg9lu2nPJBRkEOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8hW3Icu32YpX4MMMfBKofUdXAhk8zTVLp5A3VYY9984=;
	b=eni3/e3ZD1+6IsbENcSnK9N3q4MxIzZmQ5vyPkJz5LKfVSZRN4ifik+rnmnbjWigqueP
	 BlO5CfAwtmn3UKP8Y9SvNjew8LLWxVBXNxsR6Y09y2ISIGIXVOQukwIM23CwYbuWmj+aL
	 zpbR2W6flB0TvuDSmSbxChUXs0orK49KuM8IOS1SRW+VcFK8yaZP1uTjBsyUgu6+mEQlx
	 gOf2ouWmGdBdCNNOE+o5SW453cLenM2/zc7/a855T3uG8yaEfN0QPAZkxCplGSs11pE7N
	 dAbYrAncxDkCJDICRAK74x/+Gs3CNdf5b3PCevaBg6I3CW77qZ7q0DckQHr78L1j6pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2COT8Q8;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EE6606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89EE6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2COT8Q8
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a3c08d6928so4551562c88.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 04:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832355; x=1795437155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hW3Icu32YpX4MMMfBKofUdXAhk8zTVLp5A3VYY9984=;
        b=M2COT8Q8crFqanvp/JZI70a4Y0PeYmbOCf2PpQwD/jYf0MPLVIVno9HZb2H7gfdJm0
         bGF0ixrSfXRY0bT+PEqwqE1+t9jXTrA6vKoes0p4f6gaR+W7z+BVWqMrWJDeDS/IHLhF
         BUsI50LLTYS3BCoaQN16acZxvVPAYuUkZPj6OWNEJa11ktTm1eqMdcmMxkn4qZFN7VRt
         +9Um+97M9NC0JP73zh33QGVLaqDfRnvCaviNlAU1xip/a6nV3ru5C+2+irKkvMaGOo3w
         Hq1sbH88jWHXnfX8gwMNQ6EtKzEndhC9iQbfqgcJCcc0szKOvlEM1wUw+XZ9PrG/owwn
         gryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832355; x=1795437155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8hW3Icu32YpX4MMMfBKofUdXAhk8zTVLp5A3VYY9984=;
        b=xnjB7Dh5JY1admqujMKTMVncp9znyfL5Co4VrRc/zs6meVwVNMJsHwHNsA6+Q5VPv4
         yPizhSJoNwghXAKZ/fAY87dXMKxnRsr3NZ6BvP4VBbtNBFKLdi9m4NT0CIsffXkbW2mC
         FeI35R5glh/pTkBBPOvnbXfa/Ofd+toOxmTMEnTY8Cw6nXBMariLAxG/lSb+0mA/4YDf
         6ZVkIyVy0c9xtd4olL2RJHwwLjTGRBuXPG5fkr+vQYUKmS03mDCIDXbQ1TVl7aV9MrYU
         7DoIpOg1MUZwxeWE47/imCDT+5wThdE0Gj4CwMj/BX3mTV8AEHn5a31YkeLXnAe2e76y
         FgpA==
X-Gm-Message-State: APuU4Z9jKDQKqI7HYJcloqmB/9x2fKuGEIwP9B2KXInzlArLtTCX9mJR
	BCCza2JmN3DrR/8QtTSlUXQsaOJfLM+Nf825WSAGt68psYHFKrK60dbi
X-Gm-Gg: AYBFou3e2HNAOpY7Bvcueg93n/ZUM0PuPSlMSSIXxVeB/5E0u0oui3TFOlezHPEqj1/
	tzVEQe52OGKWwAF6DhGpn6p5SWmgWZSoS0OZqmEA9MzOkGAjzBV1qz9sSDbetawbKAXdW3wIqt5
	GRg0rJUzuvXpp2so97nPL4+EuZ9V/Y4zqcadhHfttQyE2Y7bQdN1ezbnH6mBZ+e2aajlpVs9bOe
	nZom4BXTg9nMVp4aWobRCH+ABdN+QuDAGZ5r0WKOCkyvUxxLvAU8WGbyWZU8hHHIWZiG3Qk4Aao
	rIqcfL1ap7OllnLAupAq/L+0cKD68/XI/zUWB4+XVL2hoG1vNuPzCgwB7zztnNzG6SYmiFM1YFI
	L92kbufMC6yAFHienXyWtHLqacXWQVSs85vUhdHAkB7kLn38AGcTpHA2MkswmdW8K/jjIMCKOJf
	YaipDQVr+bF6T5hIhLrnbdX550U4GOFTNAHUeB9zDOX7ifHzPF+0h8l3yCgZnoWNUNFzHMLvBjC
	3QZaTfw1R2uFnIkovNMj1pcWFMryVObZHdn0RMtxiGLSOwt2OVL8zDP+5ZhUJwxARMjDJjIHiwX
	NYLFZVbI1pAylqdQHiDmPf9vAnW3DBpS2ZudhNMO4e1f8g==
X-Received: by 2002:a05:7022:5f11:b0:159:2c6d:fcc3 with SMTP id a92af1059eb24-1b5030e7803mr8770798c88.33.1794832355331;
        Mon, 16 Nov 2026 04:32:35 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031bc518sm30276611c88.15.2026.11.16.04.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:32:34 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: netdev@vger.kernel.org,
	Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v4 0/2] net: openvswitch: fix a feature leak on a failed change
Date: Mon, 16 Nov 2026 07:32:19 -0500
Message-ID: <20261116123219.1781480-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <998d522f-e61d-420f-9834-6bdcbaab1361@kernel.org>
References: <998d522f-e61d-420f-9834-6bdcbaab1361@kernel.org>
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

Hi Matt,

You are right about the hang, and it is mine. I reproduced it here.

To get a failure reason into the CI log I duplicated stdout onto fd 9 in
openvswitch.sh, because info() writes debug.log and a failing run
deletes that file. The suite starts daemons that outlive the script: the
per-vport upcall handlers from add-if -u, and the psample listener. They
inherit the second handle. runner.sh reads the test output from a pipe,
so as long as any process holds the write end, the pipe never reaches
EOF and the run sits there after the last subtest has already passed.

Redirecting the output to a file hides this completely, which is how I
ran it, and why I did not see it.

Writing those messages to stderr fixes it. stderr still reaches the
runner from inside ovs_sbx, and the daemons send both stdout and stderr
to files, so nothing is left holding the pipe.

Checked with the output piped the way runner.sh does it:

  before: "TEST: psample ... [ OK ]", then nothing until the timeout
  after:  21 tests [ OK ], and the run ends by itself
  with a wrong expectation injected: the reason still reaches the log and
  the test fails, so the diagnostics still work

The configs merge here as well. The only message is the CONFIG_IP_SCTP
m->y redefine, which is already in the fragment before this series.

I will send a v5 with this change.

Thanks,
Minxi
