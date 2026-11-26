Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660461;
	b=Y8SomL4HH+cc8DhNY7HbxyaTNEVXGqHDIcDQaKTR69AKGiem+Kaa3Zc+gaGMl7Q3voVW
	 cupAOYh57p8naRH8fjAw2frOa3jTfCK+nJarOiVg2jVYcxvwrClAT4XdGcgikbmwN8BjB
	 BPK7DbVhcoIiW5zABeMQuqiNxXVqapSYBo6tLJ5FqjsPfjtxYawQokdauqi2lMqITz5+5
	 oP3svhyL2rw2MCXWcJoksp87t/8p+FqsMBm+rxKE4EFosx88mPhtk4J+UiND/85pNXv7U
	 eD8uluriOS82qO4eURCdUCasc9Sx6JoYdLoe/66suOIar1Nrgb9ebFojuy44kO6iH/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=l7NCpvda8MMuYA8JXOi0QBtfmGs+f/+STbXx6K3E7u0=;
	b=McNZPjrRARbZyUzc+MacUNcW56t/ZS4EGxLfu/S4CFaCrN2pHgk0okyKh56Iw1TFwgyh
	 eQcxmLrB6sSBj1sBoACVfWRpmfmNFwI+p4O74Zh+43qW2UbDopW4AiW6gbrg9H583JMR7
	 OKQxN4ZoKvZLVvCaPdCzS18HN/8kCET88S5ydkXafzKSfRxHsfOVudnk63j06bj/X/+eQ
	 Id7HBVT1L+FAun0RwJjccMxmuseLWcEYFUQZD53FD/8h1D8Ly7xuzvMN5yvQHmdUBPs3x
	 Y9N6iIlaakh9JYX6ZVkrdsW2oiGuiuMaSFFToHkmiG4ACiK2R3XqTqX9v4oKoAvkexw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQpidh77;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D39606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 02:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5D39606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQpidh77
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9211bbce3abso51204956d6.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660459; x=1796265259; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l7NCpvda8MMuYA8JXOi0QBtfmGs+f/+STbXx6K3E7u0=;
        b=HQpidh77Q4Cce3V7FtrCF3N7xuQQh9RIBWPJM31VGkiVecc35zI0g7Fy/dG7uBvGZc
         TERRUHVMp+GbajUDqsypEBWzw0k2PncYZYjxTzH/KzB94LRQgAXNVjVefUy8YR62Hlaw
         Uy6l/OUTZrQBuIyiEvneklC+9mWq+dwfYlUfZK/u3BnBbhRU3SdYsGVqbaRO42gNfYUg
         HFyDtceeH/YkWshrNUF+opoU7zB3B6RvahWx8pUE22uLTNK5FTWuF4PN/NAG5q6qJVrX
         e33T2oDjhPH9g1h+1yy7OiFVW6sp98nOKum12nexXmXZxVModrtS7UsExlUPxfqENBSx
         ytLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660459; x=1796265259;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l7NCpvda8MMuYA8JXOi0QBtfmGs+f/+STbXx6K3E7u0=;
        b=RqGHiqjdVke0AKj98O6NDr7hk9p/gZdAEsMJvbt0gNR1a06fnpX9fWvZPui3++ibPZ
         7i3GCi8eK3JVSNhrTBDWbrXB1P0zmdBfif2qjXCKvoMJkZm/u0uHF2CEzPlPPzGpUUcR
         O3UXsBs36bekvH4PY2qBerttn9rVW6JY/FG/10/nPSonQF1sM8hHkbXKSQ6r1I3CeRXE
         KQqNkrtsRq4oY4Yf1Gjam4juQwEoBHj1b8iZwJnB+vtKiFQeW7dum2q1FZrHSwpq4pqq
         ZqLcBaoB1rz2TRni3mUgan/6jygdqp+d1wRzoIF6s91JCW1E3+DZPtPmvUSjhqtwQLPB
         vInw==
X-Forwarded-Encrypted: i=1; AL+hErFDRwzWKcBwc2FqFkUicyQ8tbb2Y0nZSAwLWyF1Tw+hcyDfZs3WIk7sidCWC9QilegQZl+6AgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b11+8kUrRg2uVCz50FAjERXbKesi543bQnGZ3qW6R9iuRHNbq
	x7WqsihwE8/Hiq64T9xurmm3CjRw/MeUyhlY/2Gt9dPK5jKzXjue2TwfOXY5QA==
X-Gm-Gg: AZFdTZeKqvgwVSBL3xCT225ma4zN9Y2K78enWH0YfrQBIui7dxl0PjIWOQOaoBE0SVH
	rTV+gqjMO0eIUwASBvyiOdmFHO9nYhIjgo5572EhTODEACGOGndpzoy/uRIhXsN75hF1gtM8A6N
	+D4RGRIIaLqHYN03EnUqdA6crX0S06KJn27ex4c9sqdVU5tdNgIv/CIx9fhoQPmM3PmNrVdO5rM
	qYA0w38W6S/MigjIj3IKCvIymNeLcTmTiqbO/EIlcP357ee0K99jD8e6X8NFx+ueF+5oc0DyAlG
	Kx7l4KzZMVnnZqVq3AG6A2a2NXCOXOwdgqYYpJ/+vjjj/U3DeYkSBv2vlYr6DM+b0JkWwKeGnUp
	G92rcJghUiJRYuAPgt3pP0Noql1E73rbCo5l9Ec4DfZ8B9wevrHKDbLCu4FYxwBjQowtOKf30aA
	Oda44sc8wHggahtfz5iNm26jStF9D6BHj82HelXoGeQLPN8faGR8+MlwoXbgPrCiZRh6raHULCZ
	k/Zd79ZipkovfBSQAA6qFBAFtV/5cKrpFMXu3P1XUUfUotSOVFaK1hR6VUCpaFOEE9T1i8yzbnu
	AEP8p6/BS2E4l/zASN+aM2rPDgWM32h4th9kUvE5R/s96NbrX9e3wwMy9g==
X-Received: by 2002:a05:6214:202d:b0:921:7d6a:446d with SMTP id 6a1803df08f44-9217d6a547amr65492956d6.13.1795660459540;
        Wed, 25 Nov 2026 18:34:19 -0800 (PST)
Received: from localhost.localdomain ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm176032416d6.41.2026.11.25.18.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:34:18 -0800 (PST)
From: "Soheil Hassas Yeganeh (Anthropic)" <soheil.kdev@gmail.com>
Date: Thu, 26 Nov 2026 02:34:12 +0000
Subject: [PATCH iwl-net] idpf: report Rx overflow and length drops again
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-b4-idpf-rx-drop-stats-v1-1-ac492e92faa7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKOaB2sC/yWM2wrCMBBEf6XsswsmhIj+iviQy9ZGJA27qRZK/
 92kPs7MmbOBECcSuA0bMH2SpDm3oE4DhMnlJ2GKLYM+a6uUtuhNa8qIvGLkuaBUVwUv3huKFG0
 0V2jfwjSm9fDeIX3fmKnC4z/I4l8Uard21Dsh9OxymHp1yDu97z9XzEWInQAAAA==
X-Change-ID: 20261126-b4-idpf-rx-drop-stats-7bb4eded6d49
To: Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alan Brady <alan.brady@intel.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
 "Soheil Hassas Yeganeh (Anthropic)" <soheil.kdev@gmail.com>
X-Mailer: b4 0.15.2

Commit 43b67308df98 ("idpf: refactor remaining virtchnl messages")
started copying rx_errors from the VIRTCHNL2_OP_GET_STATS reply, but
stopped copying rx_overflow_drop and rx_invalid_frame_length. Since
v6.9, rx_over_errors and rx_length_errors are always 0.

Add them back. Leave rx_errors and rx_dropped as they are: virtchnl2.h
does not say whether the device already includes these drops in them.

Tested in a QEMU guest whose kernel was modified to carry a test-only
emulation of the device that sets both fields: the counters read 0
without this patch and the set values with it. Not tested on hardware,
and no selftests were run. A kprobe on one machine (x86_64, 6.18-based
kernel) showed both fields of the reply at 0, so we have not observed
a drop that went unreported.

Found by an LLM reading the stats code while we were debugging Rx loss
on machines in real use.

Fixes: 43b67308df98 ("idpf: refactor remaining virtchnl messages")
Signed-off-by: Soheil Hassas Yeganeh (Anthropic) <soheil.kdev@gmail.com>
---
An LLM-based coding assistant found the missing assignments, wrote the
fix and the changelog, and wrote and ran the QEMU test. Built with W=1,
the driver's directory only: x86_64 allmodconfig and allyesconfig, and
i386 allmodconfig. Not run on an idpf device, and no selftests were run.

This restores the v6.8 mapping. The same commit added rx_errors, so if
dropping these two was intended, please say so and I will resend for
iwl-next without the Fixes tag. If the device's overflow count means
"out of Rx buffers", rx_missed_errors may fit it better.

Based on net/main.
---
 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c b/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
index c89783966bae..bdbfd3d4e545 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
@@ -2503,6 +2503,9 @@ int idpf_send_get_stats_msg(struct idpf_netdev_priv *np,
 	netstats->tx_errors = le64_to_cpu(stats_recv->tx_errors);
 	netstats->rx_dropped = le64_to_cpu(stats_recv->rx_discards);
 	netstats->tx_dropped = le64_to_cpu(stats_recv->tx_discards);
+	netstats->rx_length_errors =
+		le64_to_cpu(stats_recv->rx_invalid_frame_length);
+	netstats->rx_over_errors = le64_to_cpu(stats_recv->rx_overflow_drop);
 
 	port_stats->vport_stats = *stats_recv;
 

---
base-commit: ef3e21c61baa74e39a49b75318bd4541562ec43f
change-id: 20261126-b4-idpf-rx-drop-stats-7bb4eded6d49

