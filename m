Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567234;
	b=i6/mUzNdNHzCCaWbT7SH1IUVxkDrO6FhSCmiikwpxONNWlizLfqdGCg9Bo2R9W5NZHev
	 bHNdUVAZS5Q/gDUrMO3BqVXxcAVTdyvvBH4StJPjiSERF9TIvGnhoCrZ5NL4FN5sINB0/
	 n7bd9tGDFHJjorNygCp0S+YzK7AUaWNy+TiUMGUaRnXnGYO4xBhSOK0atN7ajT0HAP2C9
	 trU9x8wBnCrSn4bP5V4t55/6IK5jmQZ7wRES8BFW+lY/Mat+ZzET+QwAwE4SJoTMlBRfq
	 UKuz+6fCUqLx+0XWd2AtqLnHyCTZ4cXpxUShyC13OXBt4G4lOiYHw3YvOkkdLUyEskg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iQp3FL1AhJWJCBrSbW0bWv/J/BYowcIJDYfUbu+myC8=;
	b=gQsQIdV+dmKnoJ4thQsTCgj6IunI+Un+LD+yyQVq30I09aOJ47reSQRk9QLfdzpdWl7M
	 tCYHFh5dJ9PqVQ+y7Hz/Q5JH/YK49W6Nc60l3RMKLjLx/qFaynSw0i9QlQr0YY6+b6tM7
	 O1LutXK0ctnBBAKb03J/nErf7YJdy11R2K6DWX+PFcx8A+Ru33mA9WpzlBKIEWjLRuzY7
	 sZE2Z8dAYk5gH8z7UJWUIDUEB543Jeeq31hzpKUcVcN+I0bsusEVzn8Jm6LhwDKA4oIwE
	 Ufp4XeYdjsoY4ceXC2xsgAM76qWSLTtIi9koa7Uzpwv9PZUViGyAWSLmm9epVfePlrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cQkII5RV;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE920606A688
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE920606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cQkII5RV
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so8079904eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567233; x=1796172033; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQp3FL1AhJWJCBrSbW0bWv/J/BYowcIJDYfUbu+myC8=;
        b=cQkII5RVHEmWNikZXpQLx3zMH5fqR6sM28sz4cTQL4aAidFTedYAxNIUAa+u/jgoRT
         ildClxhnM1XrKQ30Qpu2VDDRNiwSXeoR89KekXFsKLtGlY3b568LJJAmyTaKF65vDcWw
         hs10tJuSWdvDHPCW+r6IXwnqHVgl6jVpQrpYjFvpPk427LzJuJCosAp82VprZPHZLG4j
         huvpmwJL8LAIqFV7MsNFnHtnhFSy8X55EUCGQWocYMU82hBX97/Q4TCEWE228fYUIRBE
         WIM26UotWfvpIb0BRO+Zpyb5ckUbSxFk3w0Yq1eTTSperQlDPzRt05MubgxK4JwlIOdP
         u8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567233; x=1796172033;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQp3FL1AhJWJCBrSbW0bWv/J/BYowcIJDYfUbu+myC8=;
        b=HJc9sEbTrKGUqOdnXEZsBr0ji6mt4+1u0h0GWZ/e3ULZaSGs6ZJmiQRNtl6inedwql
         sHXjUmA2/0/G1HLnZ+dm7JXPkyQ+u0EMsQ9GbJJZgpeJEYJlpsIUcwjEBJpJB6LENz1v
         Rvm7oy4VY1g551mJ5yGeRKvcpLEczR4uKZHqHYX34HhxnsW+Uh9Fk5wxlUcBWaa/iRFe
         cq+V3g/jaTE0KB3bGucSvSmGQbnj/0OeFq95+KQMpB+fSt72jP5CNuylZJ6UVaeK/HgL
         1kv9XXilMaQ9jyEfbFNRljsF9DXHCLInv9GG0/RRnvndHFtWX671IZhxjUpl/d9pic6A
         dapw==
X-Forwarded-Encrypted: i=1; AL+hErHBWHHc8arK8/giaGKMa/pnOdLsh+q70Ie2LuhUGdaqvzf5AXyNLXE+KsfPFHRBjqbHWkKRdY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4NlT52W/X9WPJLODpybaawq//JQOGq+gAKyrkd/mCwuIGTKQ7
	nhXQ1gN1TuNmoz5xU2wkM9lMb41WJ63L2mMlDNeA/8++mmK0ghgJSLuYxH7B/YxA0HigE2HiJoI
	PNNMcH+10XQ==
X-Received: from dyvs10.prod.google.com ([2002:a05:693c:42ca:b0:385:6c3c:3ea1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d205:b0:36a:1f8:a56e
 with SMTP id 5a478bee46e88-3856fe564a1mr16387145eec.23.1795567232754; Tue, 24
 Nov 2026 16:40:32 -0800 (PST)
Date: Tue, 24 Nov 2026 16:40:31 -0800
In-Reply-To: <179545939880.3135.6341792822211409455@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119170729.1524516-1-irogers@google.com> <179545939880.3135.6341792822211409455@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004031.1005034-1-irogers@google.com>
Subject: Re: [PATCH net] net: lan966x: Free skb when PTP TX timestamp request
 fails in xmit
From: Ian Rogers <irogers@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: horatiu.vultur@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	elkin@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 10:43 AM <netdev-bot+sashiko@kernel.org> wrote:
>
> [Severity: Medium]
> Will this tx_dropped increment ever reach userspace? lan966x sets
> .ndo_get_stats64 = lan966x_stats_get. dev_get_stats() adds only
> dev->core_stats on top of what that callback returns, so legacy
> dev->stats is never reported.

Good point - dev_core_stats_tx_dropped_inc(dev) is needed so
dev_get_stats() reports the software drop alongside lan966x_stats_get(),
and it avoids an unlocked increment on dev->stats.tx_dropped as well.

Daniel, let me know if you'd like me to send a v2 with
dev_core_stats_tx_dropped_inc(dev) (and netdev_tx_t return types for
lan966x_port_ifh_xmit() / fdma_xmit) standalone, or if you prefer to
fold it into your upcoming lan966x PTP TX series.

Thanks,
Ian
