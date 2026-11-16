Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824520;
	b=b13oCF8oMU4la9keQCgP8KoA3Obai3hiV9DdGPG7OhOSHSpahOo9T6mvn9CVJkYbkS1Z
	 Ms85oQm0Dv5e3X851q0uRUiD9pVFEOjUkWH8ioQV6kSmxOxBiA9CdHXWI+ut0b9reR1+S
	 4SgOjBJeiIFNxH4bEs/+ApNH1m84jrmuL835+BTcnPoWll5XBxxhhADVfdmeGzBgcmCNy
	 EIgWbU4AhiRfDfn/MELWV+Fuldm5KwbGP6gbVKDIcrAbIFhXvICbHwry59nDb/jZWn+BN
	 +3aQJ3H4Gw9RHEI3sIr+r8n0CtcPHv2bse5IFsh7/Lejf0+4wdV/X2kJtIXrgScwpyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824520;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=95k2Iy13yoDS+kywNlvIjNWyQBsXVtjAHDEMSkqvDoU=;
	b=zIMQxsXVVB7vSFBfe6uipOtLtGDZ0C8txMb4mXm3IN/0wQ+os8xhvlA/X38rabjk34bN
	 pydOpO2Ffw5zKGw4D3i8mptlUza/TnunhbHW/qkg8BKhGgnf1/Fql5eOE6h1E1JbmxQz8
	 BsziZuhSGIMCji+jc+71DfLmKg1fEa+vY6B4872yiVYLt3vj1+7nqCa3JrZmVNHh9MWGZ
	 nFJR526n7PUN0NPzT67XNiP3i6TQvE75jAQ+FYj9e+K0Cd5ZqMCkuHcKST4RmbWKU450o
	 HoxqQkTVe7cZANZh7WXvGCy6hceBHAb4geYcSGNONgoZIfO9drvBI2w6ve9+ORQnNww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZnPTgi+f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E39606A333
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZnPTgi+f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640081F000CF;
	Mon, 16 Nov 2026 10:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824519;
	bh=95k2Iy13yoDS+kywNlvIjNWyQBsXVtjAHDEMSkqvDoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZnPTgi+fUpzmIzG1FCvbl2Kebue7HI8m4vGobSK9o0uWgGIldu6Y4vEDaJtspQkCu
	 oOXOPMDxSCblhcqIIKyqFmpGvem9iZ+HDlcnHMUfWxxJ9HQGvfIq6r8DoN5nIaoOSe
	 LKl7FefbFjz4qp9ZZjJW4mKYX6l4+jgm9b3JdURZsEsbBrcKODA7OUCza8fEP/nHRm
	 auX+h49U4n8/SEl9rsr3+mRxKd90yZxZpFF/bgon1zM2nVTOoZvcIGc91Kih4r/hy/
	 BFoHLcqSo/o/g4gmdBNG0duIWfbGhL6+V9Vu9ij4zbpz1hoS/x06asyeadH8cxPM4U
	 MAsx5TNr5BYBQ==
From: netdev-bot+sinfo@kernel.org
To: Petr Machata <petrm@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Ido Schimmel <idosch@nvidia.com>, mlxsw@nvidia.com
Subject: 
 Re: [PATCH net-next 0/2] mlxsw: Fix teardown order of CQ NAPI instances
Date: Mon, 16 Nov 2026 10:21:58 +0000
Message-ID: <179482451886.3291.15742045980159368371@kernel.org>
In-Reply-To: <cover.1794823524.git.petrm@nvidia.com>
References: <cover.1794823524.git.petrm@nvidia.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
