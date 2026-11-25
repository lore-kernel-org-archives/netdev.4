Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597108;
	b=U2QROst98tQ29WIbcA5ErrqaLjGfKEW1ehQ9HtmHxnUMEF4g+Ldmh42WWBE9bkKeAa1k
	 SOI4g3IVKhnwIM+7NK1j4ccgiJ6ov/nyNftRjAp6dEiC0raxSPVmJvv5xxWwBV3jrsEVA
	 nvIprfOcqQs9qrSS3rQVkYCa5jPNkxpPit4mGvv5eEH17w2OzBcQze1NkhQOSJQ9WLsE2
	 qifhIIo0QSWmnHUlho4VA8ob1SwRFn3UJmMMV/sM7af262852AABpUbWuRACPhQ9ydMak
	 4m+93FGl1KEoMeduVk4AS1gCq93C9r9WEjPD32SJuUPBI7nGkGyTQEqnR9IZQOTyu5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597108;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mRP9hIoi3pw5vrZtCIj+mOt5jd3Zzi4d0ov9dcY//Xo=;
	b=tHHx4dcjv5JNfGOZSeOBtNiFYCjGyO8bonHrm4trAGkFpL/XakH1bDFoM+t7q2cmGx5D
	 78KPy7LJYjDWr/SgEmPZq1CxCK34JdmVK39ClMXuPq4zxQjPbWX2fJubq1TzTyop0cjfQ
	 81/W96Vlb413/IB6kPHjqTaZXiY/VwoIU+vhqNlRt8VvCtsTIEy04gbYKKKjUG0cts2gn
	 4nkmIWKiZ59TRHWK+CVON2XmvnPO8ki1KnSlIc9DwJ8GmPBSKt8Xm0UvGj/2PJKEefK+4
	 KClso50IMrbHJ4SSNyFV+tfWHcIVvWBcFRoPsfUfYaG/u4X2dhCbKQ/tMJVEq11Z+Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RvGwR+y6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BE1606A31E;
	Wed, 25 Nov 2026 08:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RvGwR+y6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AF41F000C4;
	Wed, 25 Nov 2026 08:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795597108;
	bh=mRP9hIoi3pw5vrZtCIj+mOt5jd3Zzi4d0ov9dcY//Xo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RvGwR+y6KMgRRTxkENtPUydm1MWOMeDw4ePB9hbtv6a3YWBXbY/Wf47kACgDd2ZyQ
	 IoAqc1Jmuk8UFd0z/uRK9M+i4Yt7N2BNPFZTWNotSNxDShYiQ/QJB+ANwboBeCdhYY
	 +uH8T2PA6lFduSW6LjFJnvY/atuR/4DgZK+7BpJV9nI2YF1MlQt3+2TQQZh5sM4pVo
	 7/+l8xwXzxVMIG4Z+j7dnn+WXysCj15rT2AmJu1bDnJaziyKg8p9lPuzyDs8JS3hUQ
	 c83693Hd5N3+1mSVQws/fx7hSRe4922nkXjxt9sJ5VkUDOiiicUa2oJ09j0kfxi2Vh
	 skLobAIECEOyw==
Subject:
 Re: [PATCH net-next 3/5] net: dsa: lan9645x: add mac table integration
From: netdev-bot+sashiko@kernel.org
To: jensemil.schulzostergaard@microchip.com
Cc: UNGLinuxDriver@microchip.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Wed, 25 Nov 2026 08:58:27 +0000
Message-ID: <179559710763.3135.13351843539834779917@kernel.org>
In-Reply-To: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-3-b930a1dae700@microchip.com>
References: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-3-b930a1dae700@microchip.com>
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

- [Low] __lan9645x_mact_learn() in
  drivers/net/dsa/microchip/lan9645x/lan9645x_mac.c decides whether a…

--

net: dsa: lan9645x: add mac table integration

This commit adds MAC table support to the lan9645x DSA driver and wires
up port_fast_age, port_fdb_dump, port_fdb_add and port_fdb_del. It also
enables FDB isolation and assisted learning on the CPU port. A CPU learn
failure flagged in ANA_ANEVENTS.CPU_LEARN_FAILED is reported as -ENOSPC.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_mac.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_mac.c
> new file mode 100644
> index 0000000000000..9da03d0369f5d
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_mac.c

[ ... ]

> +static int __lan9645x_mact_learn(struct lan9645x *lan9645x, int port,
> +				 const unsigned char mac[ETH_ALEN],
> +				 unsigned int vid,
> +				 enum macaccess_entry_type type,
> +				 bool cpu_copy)
> +{
> +	int err;
> +
> +	lockdep_assert_held(&lan9645x->mact_lock);
> +
> +	lan9645x_mac_select(lan9645x, mac, vid);
> +
> +	lan_wr(ANA_MACACCESS_VALID_SET(1) |
> +	       ANA_MACACCESS_DEST_IDX_SET(port) |
> +	       ANA_MACACCESS_MAC_CPU_COPY_SET(cpu_copy) |
> +	       ANA_MACACCESS_ENTRYTYPE_SET(type) |
> +	       ANA_MACACCESS_MAC_TABLE_CMD_SET(CMD_LEARN),
> +	       lan9645x, ANA_MACACCESS);
> +
> +	err = lan9645x_mac_wait_for_completion(lan9645x, NULL);
> +	if (err)
> +		return err;
> +
> +	if (ANA_ANEVENTS_CPU_LEARN_FAILED_GET(lan_rd(lan9645x, ANA_ANEVENTS))) {
> +		lan_wr(ANA_ANEVENTS_CPU_LEARN_FAILED, lan9645x, ANA_ANEVENTS);
> +		return -ENOSPC;
> +	}

[Severity: Low]
Could a stale CPU_LEARN_FAILED bit cause a spurious -ENOSPC here?

CPU_LEARN_FAILED is a sticky write-one-to-clear bit. The only
unconditional clear is in lan9645x_mac_init(), after CMD_INIT. The only
other clear is on this failure path. Nothing clears the bit before
CMD_LEARN is written to ANA_MACACCESS.

Two cases can leave the bit set:

  - An earlier learn takes the early return because
    lan9645x_mac_wait_for_completion() timed out or got a read error.
    That skips the ANEVENTS check. If the learn later finishes in
    hardware and fails, the bit stays set.

  - The lan_rd() or lan_wr() of ANA_ANEVENTS fails. Both only
    WARN_ON_ONCE on regmap errors.

The next, unrelated learn under mact_lock would then see the stale bit,
clear it and return -ENOSPC. The hardware will still have installed the
new LOCKED entry.

For host addresses on the CPU port, the chain is:

  lan9645x_fdb_add()
    lan9645x_mact_learn()
      __lan9645x_mact_learn()  -> -ENOSPC

Because of that error, dsa_port_do_fdb_add() does not record the
address. A later delete gets -ENOENT from dsa_mac_addr_find() and never
calls .port_fdb_del. The LOCKED entry that points at PGID_CPU would stay
in the MAC table. It never ages out and it takes one of the four buckets
in its row.

The mdb code added later in the series ("net: dsa: lan9645x: add mdb
management") goes through the same lan9645x_mact_learn() path.

Would it help to write ANA_ANEVENTS_CPU_LEARN_FAILED just before issuing
CMD_LEARN? Then the bit would only reflect the current command.

> +
> +	return 0;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-0-b930a1dae700%40microchip.com
