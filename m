Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451463;
	b=4KSNTa/VRvkBHWYKnDMDTrsTgcvwhBihC2ZyE/vPc/nnbdwoz75PgFppWGXbpTJzOHuo
	 JigaraY/+SSOgdNWPhIyD3UUbmkzOHVnSfFNpNRT7DCz5+2dBoD7Qzz4+w4jvEhJ7Zqna
	 C3XWXnkByc8KCvtmbPCuyuoJ2S0tbcoNgnbXlO1JXHXhdTsI3mCRHXUN0YoL3vNJxdek7
	 Tq0R1mDtLyHAalIcznSm43eL2Hc1T/vWiNmzZ5O5wpOvbLpq5mGgreA3MhT76nTwrgr51
	 ArpzBKNcZqs9onAxo4PqlgDbChXKoRwHv9Ia/Z/Pm0Z2wfNdoqgCrwC0RMgIEd2UBXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451463;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jMtoEqXohvqbclVtS9Z+5YKaFu68bPrDQCuZaxatwVg=;
	b=LZcl+mmKmvleHjqs7jyNsGoppgB62143xyCW+tyGt5e0zGx1Ehj7f10ILfl8i1VA+Hfq
	 +Ukf/2uCDadicddkKyx1+F5FA79pEKQ/iGfSV+LuGOoosmMUWyv9clxcVEAVmFhBEVDr6
	 uF7rYO0GVcVODuzD1l7BvdbMtlfLmd5Vb8LKvjsD9qHWvMTvZ9taKALKsusg7Z9E4NZA+
	 rTDRXd5d+d+FN9xxw6Im5Tmm3OseQ2wW74EkaownwIoTrd56pzLOjYy0RKdavsdyBqCln
	 pm2HUEKhwUhAScwA5bjXzO2MSdmmC4YWN9435taALFrMcqWmWv6lwHjFrwXjIwpHHNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LcojK46x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A40606A31A;
	Mon, 23 Nov 2026 16:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LcojK46x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899C91F000C0;
	Mon, 23 Nov 2026 16:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795451463;
	bh=jMtoEqXohvqbclVtS9Z+5YKaFu68bPrDQCuZaxatwVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LcojK46x3wYV53qVzLH5hJDKmV2TAvMH7bVELtrYyr0zL68uIMU/dx8DQLFhpPmbw
	 GFZ1/oB6yTH7t6lOUTaBn4mxsqpRjt+Qni3iNgsw3YJer5jZIXnEc2s+7VcgGJCAEE
	 KY1AO9vM2uf0fwtvebGqLjQlOCHCC8xDLT7OTVzc36HYEVcLNRfGDIkbWM3kD/8blN
	 7cFdV9ao45SOmJnViwYRJOZv5Q+1XMzsFAJ4+3OwxxjEUgfT3XApZEDeITTK1fdNOs
	 jz55NsEp6RJCihCcgmwI3OETWc05nnH1MGRDEo7T+KKWn4w2CUoRLhc5EdrwAkaIJr
	 WnBNENAPWSbUQ==
Date: Mon, 23 Nov 2026 16:30:58 +0000
From: Simon Horman <horms@kernel.org>
To: Changyul Lee <lcy8047@gmail.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Joshua Hay <joshua.a.hay@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH iwl-net] idpf: free the RDMA auxiliary device ID after
 deleting the device
Message-ID: <20261123163058.GG31322@horms.kernel.org>
References: <20261118051611.3892489-1-lcy8047@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118051611.3892489-1-lcy8047@gmail.com>

On Wed, Nov 18, 2026 at 12:16:11AM -0500, Changyul Lee wrote:
> idpf_unplug_aux_dev() returns the ID to idpf_idc_ida before
> auxiliary_device_delete() removes the device. If another idpf device
> plugs an RDMA auxiliary device in between, it can get the same ID, and
> its auxiliary_device_add() fails with -EEXIST because the old
> "idpf.<vendor>.rdma.core.<id>" or "idpf.<vendor>.rdma.vdev.<id>" device
> is still registered. RDMA is then not set up on that device.
> 
> Free the ID after auxiliary_device_delete(). It still has to be freed
> before auxiliary_device_uninit(), whose release callback frees adev.
> 
> Fixes: 65637c3a1811 ("idpf: fix UAF in RDMA core aux dev deinitialization")
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> Found with a static analysis tool we are developing.
> 
> Compile-tested only, with x86_64_defconfig plus IDPF and W=1.

Reviewed-by: Simon Horman <horms@kernel.org>

