Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795301744;
	b=uuo7hh6qc5ECcp/9fbNH9agZpiE4c/kafFI2BR+3seO3EnQZu8+9Wv8aEocX+42QdVJS
	 jbvfNpUCuUlIud+BFThN1+HplzLbUlztvN3vxQ102eRDKGtMbZ2Hsu/c+LyaZkNl2h6Mj
	 +rxeU9++gHHtHihKu9CnJZaqTKAMkuYCxYXvWWlYTyzCaU1LVKe92Ie7lWL1vX1G2ldAS
	 lQVgzawgKSEGXbB5UC9mtpkedDrOslAH+wQuScqD9RhVEN4gkD5RgoDyWyXcbg7aufPQC
	 QsLe7nftCjhIeh6I/wBOJy7zkjRNn8W5E2lef24aDplOm64GgJePOLcDvteIg1ATygA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795301744;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=RB/9j81snFU7XbDuV5JRsEuzbBLUE9tMHuPHwo5+5Ck=;
	b=wPM4VVnQ0apFvvYUhGzgyhFzzp/4AwEA8crWz4qQ5nrMMHbAK4ifbCIXvXVSq1ankjP6
	 6Lub7nfa7gTEqhhapkkzuOw1jD6y+8knUFSF1MgGxUVtckBc5KaDgl7qAcwyQ34mpAokz
	 eMx9NHv0G0VzpqpWy4oVsHxEgVbHsNiGHRldgZZag6IbMsvB/tssmNuf7g6+F2OnrA5Lp
	 fLo1ZJwT291whCCfYoEkhXVXi63iIosVDxM5e+mMZne+m3j2zQ5NBL0PPzw5D1kHxqG/J
	 5mFbiup/lxWzucnY+dfGic0jGrk2hjqrknQdqmKZE2/QEvCVU4aLqfcypwUsaKNwnPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VD2ELxVV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3853606A339;
	Sat, 21 Nov 2026 22:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VD2ELxVV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D77D1F000C4;
	Sat, 21 Nov 2026 22:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795301744;
	bh=RB/9j81snFU7XbDuV5JRsEuzbBLUE9tMHuPHwo5+5Ck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VD2ELxVVPP85kZgWLBpmZFeOdKMCrTNR68j/Y7w3oBQeW9BC32ngLhU0cNVesm79Z
	 Z14y74VzrVkTav/xhV5AEwfySTBsCWDF8AISI4O5KST7PEe5dgicsfx6WW5h4Zbo3M
	 w5OBu5Cw1yo6QzHEIS6yScrez10I8dlb72ybWvbkEQmqa3W23T0NH/3smpLOAWcQ8b
	 YAPlv6slNTD0pTYMK/fwlWMh7wjxB/Ysj6gMV/eiu2c0/d6rRmAyqf1u6DRqNVHZbU
	 SUWnuTr2Jj46WzjneLDQVbm22tyv7kDCLeD8yCfRvwx5PNdMJkYyp1AF2i9V2er0zP
	 6LnIxltQzemMg==
Date: Sat, 21 Nov 2026 14:55:43 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, Ido Schimmel
 <idosch@nvidia.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v7 0/8] tunnels: add core and gre drop reasons
Message-ID: <20261121145543.52027d7d@kernel.org>
In-Reply-To: <20261117211853.3733250-1-littlesmilingcloud@gmail.com>
References: <20261117211853.3733250-1-littlesmilingcloud@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 00:18:45 +0300 Anton Danilov wrote:
> Changes since v6:
> - Rebase onto net-next a0aa9ceca03f as requested by Jakub.

Conflicts again..

Could you please rebase and move the drop reasons you are adding?
Place them next to the existing tunnel reasons instead of at the 
end of the list. The new drop reasons do not have to be added
at the end. Grouping makes it both easier to read and avoids
conflicts with unrelated fixes.
