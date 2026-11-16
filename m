Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820358;
	b=Kp/SF3U4vQKkbxdW6YIBaiFDK59S7uUMhbNoxkRwFuEwDUc9xGYiqrIL19SpD8XiyRms
	 EOj+mlJZYoIh57O5vYZuYv8VXN9xjbE2yLyJKbIjan4PFfp/7fi/N3h8LqFIcsO5wTqcv
	 gQl+ppHRoKl9nj9r+63Ux6LGqaRV8C0BNRzUfxxJkhj6cjJQ4hM9H/pXZ691ZZ4Ddu+dz
	 5zO1MxI8i7YACJDEPzgqzrjKnfB4wO1nH9F9sunNXw72gi3OvOAK60SKa1rrjaKihhWwS
	 4YWK7oRTywLLd2x/9TJD+xXgV/b/H/It493FsXy/rN5IjrKIz8C46wCU3UN+q87QZ3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820358;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wiVfDk1vkHbcCLuyR1noOlNCeghO0iI67rlMqe72ync=;
	b=lxN1IJjigstnHduRrq/oOAxO3U77NugJQOqCzb7V6ZdWC2fAxO56OFfuZMz/nQGzTgN/
	 EoczFNwsIykXtgQa1SJ1CscYdUkE597dPRnZiEohgqMWTUYXwZfp+epJ9PFpoKwwDVi/Y
	 NSLRQnHyhCYmbLPllSISsERfo7GGgejB5He9lYX2YpEF5FEV4nhvqnqyMZ7KpxYMkuUWg
	 xBlFHEE12TYTU9TfpqqKPeRJA/KU+Qab80IYdztGyTiKnkDkWWeJlAo4xzroN0Qex5QUS
	 q9wWl80fxP0vsSq90SGszaQ3STi+1qT6RdlDWWwz5zEMTCxWqDKIhvBIfkzSrLJ7PsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oa7sfw7c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB7D606A33A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oa7sfw7c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BAD1F000CE;
	Mon, 16 Nov 2026 09:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794820357;
	bh=wiVfDk1vkHbcCLuyR1noOlNCeghO0iI67rlMqe72ync=;
	h=From:To:Cc:Subject:Date;
	b=Oa7sfw7cGu/E+Z+1YcjvgIF7aIWtjQcfj54ZsLR1FCXcVM8WOcc8F+XWmhncccylz
	 a7ryKLTOX6FfH4yCMwiMIH1/x6YmwDzdUeam6W4UdNmmaswwmKyR8azjFODzP6/0/K
	 M9ZmEksuhgbH06JDLAHhiccP3waSrusE05YkK4N/ITOzVkzdX3HWOpG2SGebmuiVqW
	 B7sqcjocmKeNtZ2WvC7nFeEPEVGAeq4PWp4GGA957mNM9ogfsCv3r4rA+ADoxiZ5ZU
	 xdX6QobgfrMkbOAMthXKfJP4k4HHt+w+gBtHfiQanJ/q/XUicNa8X53dqd8oDjBsiY
	 smiKdjEcWJzIg==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xSslP-0000000344Q-2SL9;
	Mon, 16 Nov 2026 10:12:35 +0100
From: Johan Hovold <johan@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH net-next v2 0/2] net: tn40xx: avoid early firmware node release
Date: Mon, 16 Nov 2026 10:11:47 +0100
Message-ID: <20261116091149.730586-1-johan@kernel.org>
X-Mailer: git-send-email 2.56.1
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

The tn40xx driver works around a swnode implementation detail and drops
a firmware node reference it has not taken itself.

The first patch avoids releasing the firmware node prematurely if mdio
bus registration ever bails out before taking the reference, and the
second patch cleans up the implementation by switching to using a
primary software node.

This was something I stumbled over when reviewing the software node
implementation and the series has only been compile tested.

Johan


Changes in v2
 - only drop the fwnode reference if it has been taken
 - amend commit message and explain why this does not lead to a UAF
   currently
 - switch to primary software node (2/2, new patch)

 v1: https://lore.kernel.org/all/20261110100051.2567443-1-johan@kernel.org/


Johan Hovold (2):
  net: tn40xx: avoid early firmware node release
  net: tn40xx: switch to primary software node

 drivers/net/ethernet/tehuti/tn40_mdio.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

-- 
2.56.1

